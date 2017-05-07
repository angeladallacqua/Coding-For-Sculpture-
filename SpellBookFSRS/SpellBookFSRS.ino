int fsrPin1 = A0;
int fsrPin2 = A1;
int fsrPin3 = A2;
int fsrPin4 = A3;
int fsrPin5 = A4;

int fsrReading1;
int fsrReading2;
int fsrReading3;
int fsrReading4;
int fsrReading5;

int AllSensors;
int Sensor;

void setup(){
  Serial.begin(9600);   
}
 
void loop() {

   fsrReading1 = analogRead(A0);  
   fsrReading2 = analogRead(A1); 
   fsrReading3 = analogRead(A2);
   fsrReading4 = analogRead(A3);
   fsrReading5 = analogRead(A4);
  delay(500);
  
 if (fsrReading1 > 700){
  Serial.println(1); 
  }
   if (fsrReading2 > 700){
  Serial.println(2); 
  }
   if (fsrReading3 > 700){
  Serial.println(3); 
  }
   if (fsrReading4 > 700){
  Serial.println(4); 
  }
   if (fsrReading5 > 700){
  Serial.println(5); 
  }
  
  
  }
  
