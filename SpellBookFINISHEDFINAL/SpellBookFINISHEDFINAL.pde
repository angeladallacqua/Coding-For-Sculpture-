import processing.serial.*;
import processing.video.*;
import gab.opencv.*;
import java.awt.*;

Serial myPort;
Capture mywebcam;
OpenCV myOpenCV;

boolean Switch1 = false;
boolean Switch2 = false;
boolean Switch3 = false;
boolean Switch4 = false;
boolean Switch5 = false;

PImage Frog;
PImage Bald;
PImage Flower;
PImage Angel;
PImage Love;

int myString;
int timer;
int Value;

float inByte=0;

void setup(){
 size(1300,700);
 frameRate(5);

 
  println(Serial.list());
  myPort = new Serial(this, Serial.list()[1], 9600);
  myPort.bufferUntil('\n'); 

  mywebcam = new Capture(this, 320,240, 5);
  mywebcam.start();
 
  myOpenCV = new OpenCV(this, 320,240);
  myOpenCV.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  
  Frog = loadImage("frogUGLY.png");
  Bald = loadImage("alienBALD.png");
  Flower = loadImage("flower.png");
  Angel = loadImage("angel.png");
  Love = loadImage("love.png");
 
}

void draw(){
  background(0);
 scale(3);
  
  //image(mywebcam, 0,0,320,240);
  if(mywebcam.available()){
  mywebcam.read();
  }
  
   myOpenCV.loadImage(mywebcam);
   Rectangle[] detectedfaces = myOpenCV.detect();
   //println(detectedfaces.length);
  
  
   

  ///////////FSR number one
  if (inByte == 1){
    Switch1 = true;
  }
  if (Switch1 == true){
  for (int i=0; i<detectedfaces.length; i++){
  image(Frog, detectedfaces[i].x -80 , detectedfaces[i].y - 90, detectedfaces[i].width +200, detectedfaces[i].height + 200);
  println(Switch1); //println("centerX" + detectedfaces[i].x + " centerY:" + detectedfaces[i].y + "width" + detectedfaces[i].width + "height:" + detectedfaces[i].height );
  }
  }
  
   Switch1 = false; 
  
   ///////////FSR number two
  if (inByte == 2){
    Switch2 = true;
}
  if (Switch2 == true){
  for (int i=0; i<detectedfaces.length; i++){
  image(Bald, detectedfaces[i].x -150 , detectedfaces[i].y - 80, detectedfaces[i].width +400, detectedfaces[i].height + 200);
  println(Switch2); //println("centerX" + detectedfaces[i].x + " centerY:" + detectedfaces[i].y + "width" + detectedfaces[i].width + "height:" + detectedfaces[i].height );
}
}
   Switch2 = false; 

  
   ///////////FSR number three
  if (inByte == 3){
    Switch3 = true;
}
  if (Switch3 == true){
  for (int i=0; i<detectedfaces.length; i++){
  image(Flower, detectedfaces[i].x -100 , detectedfaces[i].y - 80, detectedfaces[i].width +200, detectedfaces[i].height + 200);
  println(Switch3); //println("centerX" + detectedfaces[i].x + " centerY:" + detectedfaces[i].y + "width" + detectedfaces[i].width + "height:" + detectedfaces[i].height );
}
}
   Switch3 = false; 
  
   ///////////FSR number four
  if (inByte == 4){
    Switch4 = true;
}
  if (Switch4 == true){
  for (int i=0; i<detectedfaces.length; i++){
  image(Angel, detectedfaces[i].x -100 , detectedfaces[i].y - 90, detectedfaces[i].width +200, detectedfaces[i].height + 200);
  println(Switch4); //println("centerX" + detectedfaces[i].x + " centerY:" + detectedfaces[i].y + "width" + detectedfaces[i].width + "height:" + detectedfaces[i].height );
}
}
Switch4 = false;
   

  
   ///////////FSR number five
  if (inByte == 5){
    Switch5 = true;
}

  if (Switch5 == true){
  for (int i=0; i<detectedfaces.length; i++){
  image(Love, detectedfaces[i].x -150 , detectedfaces[i].y - 80, detectedfaces[i].width +300, detectedfaces[i].height + 300);
  println(Switch5); //println("centerX" + detectedfaces[i].x + " centerY:" + detectedfaces[i].y + "width" + detectedfaces[i].width + "height:" + detectedfaces[i].height );
// detectedfaces[i].x - detectedfaces[i].width/2 , detectedfaces[i].y - detectedfaces[i].height/2, detectedfaces[i].width +300, detectedfaces[i].height + 300
}
}  
  Switch5 = false;
  
  }// end bracket



//void captureEvent(Capture c){
//    c.read();
//  }

void serialEvent(Serial myPort) {
  
  String myString = myPort.readStringUntil('\n');
  if (myString != null);
  inByte = float(myString);
  println(inByte);
  
}
  