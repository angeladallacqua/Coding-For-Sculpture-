import processing.serial.*;
import java.awt.*;

Serial myPort;

int Value; 
int varText;

//int[] serialInArray = new int[3];    // Where we'll put what we receive
int serialCount = 0;// A count of how many bytes we receive
int inByte;
                                    // Starting position of the ball
boolean firstContact = false; 

PImage YoureHot1;
PImage YoureHot2;
PImage YoureHot3;
PImage YoureHot4;

PImage YoureAlright1;
PImage YoureAlright2;
PImage YoureAlright3;
PImage YoureAlright4;

PImage YoureUgly1;
PImage YoureUgly2;
PImage YoureUgly3;
PImage YoureUgly4;


void setup(){
 size(1300,750);
 background(255);
 
 //println(Serial.list());
 //myPort = new Serial(this, Serial.list()[1], 9600);
 //myPort.bufferUntil('\n');
  println(Serial.list());
  myPort = new Serial(this, Serial.list()[1], 9600);


YoureHot1 = loadImage("YoureHot1.png");
YoureHot2 = loadImage("YoureHot2.png");
YoureHot3 = loadImage("YoureHot3.png");
YoureHot4 = loadImage("YoureHot4.png");

YoureAlright1 = loadImage("YoureAlright1.png");
YoureAlright2 = loadImage("YoureAlright2.png");
YoureAlright3 = loadImage("YoureAlright3.png");
YoureAlright4 = loadImage("YoureAlright4.png");

YoureUgly1 = loadImage("YoureUgly0.png");
YoureUgly2 = loadImage("YoureUgly1.png");
YoureUgly3 = loadImage("YoureUgly2.png");
YoureUgly4 = loadImage("YoureUgly3.png");
}


void draw(){ 
  background(0);
  
  ///////////////YOU'RE UGLY IMAGES
  if (inByte == 1){
//varText = int(random(1,2));
//if(varText == 1){
    image(YoureUgly2,367,-97,638,847);
    image(YoureUgly4, 315,-109,586,765);
}
  ///////////////YOU'RE ALRIGHT IMAGES
  if (inByte == 2){
    tint(0,255,0);
    tint(0,255,0);
 image(YoureAlright1,414,-82,302,724);
 image(YoureAlright2,346,46,471,615);
 //image(YoureAlright3,10,-40,570,570);
 //image(YoureAlright4,55,40,500,400);
  }
  
   ///////////////YOU'RE HOT IMAGES
  if (inByte == 3){
    image(YoureHot1,247,-356,1132,1850);
    image(YoureHot2,299,-65,959,1980);
    //image(YoureHot3,10,0,575,710);
    //image(YoureHot4,40,-5,575,710);
  }
  
  }
  
  
void serialEvent(Serial myPort) {
  inByte = myPort.read();
  println(inByte);
  if (firstContact == false) {
    if (inByte == 1) {
      myPort.clear();          // clear the serial port buffer
      firstContact = true;     // you've had first contact from the microcontroller
     // myPort.write('A');  // ask for more
      println(inByte);
    
    }
  }
}