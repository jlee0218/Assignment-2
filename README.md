# Sixth 0110

  Sixth 0110 is meant to encompass the post-human and the transhuman as a cybernetic melding of man and machine not only on a physical level, but on a psychological level. A sixth cybernetic sense that will develop as humans turn to cybernetic enhancement; as we take control of our own evolutionary development the fusion between man and machine can only stay solely physical for so long. 

  Sixth explores that impossible nebulous sixth sense through a feedback of mental and physiological sensations. Subjects are presented in a blank room with only a mirror, then they are presented with a piece of cloth/mask to interact with how they please. Once placed upon their face they look into the mirror and are invited to express different emotions through facial features which will result in different patterns and fluctuations in the light and shadow. The lights and the patterns should superimpose over the reflection of the subject’s face, changing their image of themselves as they conort their faces both intentionally and unintentionally. 
  
Software Side: 
  This project utilizes computer vision through processing to read the facial features of the subject. The processing code ("LiveCamTestReading") reads the facial features as boxes, the length and width of these boxes are then sent to the Arduino using the serial port. These values that have been then passed to the arduino code ("PacificaReading") are then used to vary the colors, wave patterns, and the speed of change of the LED strip lights they are controlling, which results in a reactionary light pattern that both changes the lights and changes the subject's own percpetion of their face as they look through the mirror. 

Hardware Side: 
  This project uses an Arduino Uno, WS2812 LED light strips, and a camera. The lightstrips are attached to the backend of a frame within which is a piece of glass that has been treated to become a one-way mirror. This one-way mirror is then mounted directly onto a normal mirror to create and infinity mirror effect.  

