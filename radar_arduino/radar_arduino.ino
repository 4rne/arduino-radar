#include <Stepper.h>

const int stepsPerRevolution = 200;  // change this to fit the number of steps per revolution
// for your motor

const int trigPin = 6;
const int echoPin = 5;
// defines variables
long duration;
int distance;
float angle = 0;

// initialize the stepper library on pins 8 through 11:
Stepper stepper(stepsPerRevolution, 8, 9, 10, 11);

void setup() {
  // set the speed at 60 rpm:
  stepper.setSpeed(60);

  pinMode(trigPin, OUTPUT); // Sets the trigPin as an Output
  pinMode(echoPin, INPUT); // Sets the echoPin as an Input

  // initialize the serial port:
  Serial.begin(9600);
}

void loop() {
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  // Sets the trigPin on HIGH state for 10 micro seconds
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  // Reads the echoPin, returns the sound wave travel time in microseconds
  duration = pulseIn(echoPin, HIGH, 10000);
  // Calculating the distance
  distance = duration * 0.034 / 2;
  // Prints the distance on the Serial Monitor
  Serial.print(angle);
  Serial.print(',');
  Serial.println(distance);
  stepper.step(1);
  delay(50);
  angle += 1.8;
  if(angle > 360)
  {
    angle -=360;
  }
}
