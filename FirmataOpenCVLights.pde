/* 
 Actuate a servo motor in Arduino in Firmata 
 by using face detection in OpenCV
 
 by Afroditi Psarra
 February 2018
 */

import gab.opencv.*; // import openCV library
import processing.video.*; // import video library
import java.awt.*; 


import processing.serial.*; // import the serial library
import cc.arduino.*; // import the arduino (firmata) library

Arduino arduino; // create an arduino object

Capture video; 
OpenCV opencv;

int led1 = 6; // led connected to digital pin 6
int brightness1; // variable to store the led1's pwm value 
int led2 = 3; // led connected to digital pin 4
int brightness2; // variable to store the led2's pwm value 

void setup() {
  size(640, 480);
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  

  video.start();

  // Prints out the available serial ports.
  println(Arduino.list());
  // Modify this line, by changing the "0" to the index of the serial
  // port corresponding to your Arduino board (as it appears in the list
  // printed by the line above).
  arduino = new Arduino(this, Arduino.list()[0], 57600);
  arduino.pinMode(led1, Arduino.OUTPUT); // declare led connected to digital pin 6 as an output
  arduino.pinMode(led2, Arduino.OUTPUT); // declare servo connected to digital pin 4 as a servo object
} 

void draw() {
  scale(2);
  opencv.loadImage(video);
  image(video, 0, 0 );
  filter(GRAY);
  fill(random(0, 255), random(0, 255), random(0, 255)); // fill the circle with an RGB color, controlling the red value with brightness
  noStroke();
  //strokeWeight(3);
  Rectangle[] faces = opencv.detect();
  println(faces.length); // print how many faces are detected

  for (int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y); // print the x,y coordinates of the faces
    ellipseMode(CORNER); // draw a circle from the corner
    ellipse(faces[i].x, faces[i].y, faces[i].width, faces[i].height); // draw a circle over the face's coordinates
    brightness1 = constrain(faces[i].x/3, 0, 180)/3; // use the x coordinate of the detected face to control the second led's brightness
    arduino.analogWrite(led1, brightness1); // fade the led
    brightness2 = constrain(faces[i].y/3, 0, 255)/3; // use the y coordinate of the detected face to control the led's brightness
    arduino.analogWrite(led2, brightness2); // fade the led
  }
}

void captureEvent(Capture c) {
  c.read();
}
