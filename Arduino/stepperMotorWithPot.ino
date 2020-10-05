// include Arduino stepper motor library
#include <Stepper.h>
 
// change this to the number of steps on your motor
#define STEPS 32
 
// create an instance of the stepper class, specifying
// the number of steps of the motor and the pins it's
// attached to
Stepper stepper(STEPS, 8, 10, 9, 11);
 
const int pot = A0; // speed control potentiometer is connected to analog pin 0
int stepperDirection = 1;
int stepperSpeed = 0;
 
void loop(){
 
  // read analog value from the potentiometer
  int val = analogRead(pot);
 
  // map digital value from [0, 1023] to [2, 500]
  // ===> min speed = 2 and max speed = 500 rpm
  if ( stepperSpeed != map(val, 0, 1023, 2, 500) ){ 
    // if the speed was changed
    stepperSpeed = map(val, 0, 1023, 2, 500);
    // set the speed of the motor
    stepper.setSpeed(stepperSpeed);
  }
 
  // move the stepper motor
  stepper.step(stepperDirection);
 
}
void setup(){
 
}
