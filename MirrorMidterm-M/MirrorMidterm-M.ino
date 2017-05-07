//TMP36 Pin Variables
int photocellPin = 0;  //the analog pin the TMP36's Vout (sense) pin is connected to
                      //the resolution is 10 mV / degree centigrade with a
                        //500 mV offset to allow for negative temperatures
                   
int photocellReading; 
 
int LEDRed = 13;
int LEDYellow = 12;
int LEDGreen = 8;

int LEDbrightness;

int LED;

boolean randomled;

void setup(){
  
  Serial.begin(9600);  //Start the serial connection with the computer
                       //to view the result open the serial monitor                      
}



void loop(){

photocellReading = analogRead(photocellPin);  
 
 //Serial.print("Analog reading =");
 //Serial.println(photocellReading);

     photocellReading = 1024 - photocellReading;
     
if(randomled==true){
  
if(LED==1){
LEDbrightness = map(photocellReading, 0, 1024, 0, 255);
  analogWrite(LEDGreen, LEDbrightness);
  delay(100);
}


if(LED==2){
  LEDbrightness = map(photocellReading, 0, 1024, 0, 255);
 analogWrite(LEDYellow, LEDbrightness);
delay(100);
}


if(LED==3){
 LEDbrightness = map(photocellReading, 0, 1023, 0, 255);
 analogWrite(LEDRed, LEDbrightness);
delay(100);       
}
}
                      

if (photocellReading >=500){
if (randomled == false){
  LED = int(random(1,4));
  //Serial.print("led: ");
  Serial.write(LED);
  randomled=true;
}
}
else{randomled=false;
LED = 0; //reset
}
}

