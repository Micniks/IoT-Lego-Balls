const int pinLaser = 2; // output signal pin of laser module/laser pointer
const int pinReceiver = 3; // input signal pin of receiver/detector (the used module does only return a digital state)
const int motorStart = 4; //input signal pin for starting the motor

void setup() {
  pinMode(pinLaser, OUTPUT); // set the laser pin to output mode
  pinMode(pinReceiver, INPUT); // set the laser pin to input mode
  pinMode(motorStart, OUTPUT); // set the motor pin to output mode
  digitalWrite(pinLaser, HIGH); // emit red laser
  Serial.begin(9600); // Setup serial connection for print out to console
}

void loop() {
  int value = digitalRead(pinReceiver); // receiver/detector send either LOW or HIGH (no analog values!)
  Serial.println(value); // send value to console
  if (value == 1) { // if the pinReciever value is 1 (should be 0 instead when correctly setup), i.e the laser hit the receiver, the motor starts
    digitalWrite(motorStart, HIGH);
    delay(10000); // waits 10 secs until turning off the motor again
    digitalWrite(motorStart, LOW);
  }
}
