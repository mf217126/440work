// Mariah Forbes
// Final Project
// May 8, 2017


//--------I based this off of coding instructions I found online--------
//* Ultrasonic Sensor HC-SR04 and Arduino Tutorial
//*
//* Crated by Dejan Nedelkovski,
//* www.HowToMechatronics.com
//*
//-------------------------------------------------------------


// defines pins numbers
//sensor1 (vertical)
const int trigPin = 9;
const int echoPin = 8;
//sensor2 (horizontal)
const int trigPin2 = 11;
const int echoPin2 = 10;

//horizontal variables
long duration2;
float distance2;

//vertical variables
long duration;
float distance;

void setup() {

//vertical pins
pinMode(trigPin, OUTPUT); // Sets the trigPin as an Output
pinMode(echoPin, INPUT); // Sets the echoPin as an Input


//horizontal pins
pinMode(trigPin2, OUTPUT);
pinMode(echoPin2, INPUT);

Serial.begin(9600); // Starts the serial communication

}

//start of the loop to send out data
void loop() {
  
//------------------------------VERTICAL DATA-------------------------------------------
//Clears trigPin (LOW means off)
digitalWrite(trigPin, LOW);
delayMicroseconds(2);
//waits 2 microseconds

// Sets the trigPin on HIGH state for 10 micro seconds (HIGH means on)
digitalWrite(trigPin, HIGH);
delayMicroseconds(10);

//turns it off again.
digitalWrite(trigPin, LOW);

// Reads the echoPin, returns the sound wave travel time to be calculated later
duration = pulseIn(echoPin, HIGH);
// Calculating the distance
distance = duration*0.034/2;

// Prints the distance on the Serial Monitor
Serial.println("v");
Serial.println(distance);
//------------------------------------------------------------------------------------------


//------------------------------HORIZONTAL DATA---------------------------------------------
 // Clears the trigPin
  digitalWrite(trigPin2, LOW);
  delayMicroseconds(2);

// Sets the trigPin on HIGH state for 10 micro seconds
  digitalWrite(trigPin2, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin2, LOW);
// Reads the echoPin, returns the sound wave travel time in microseconds
  duration2 = pulseIn(echoPin2, HIGH);
// Calculating the distance
  distance2 = duration2*0.034/2;
// Prints the distance on the Serial Monitor
  Serial.println("h");
  Serial.println(distance2);
//------------------------------------------------------------------------------------------

//A delay of 50 milliseconds so Processing 3 can keep up with the incoming information
 delay(50);
}
