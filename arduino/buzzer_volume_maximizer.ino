#include "serial_read_int.h"

void setup() {
  Serial.begin(115200);
  pinMode(PB15, OUTPUT);
}

void beep(int duty, int freq) {
  // beep for 0.5s with given duty cycle and frequency
  Serial.print('d');
  Serial.print(duty);
  Serial.print('f');
  Serial.println(freq);
  analogWriteFrequency(freq);
  delay(500);
  analogWrite(PB15, duty);
  delay(500);
  analogWrite(PB15, 0);
  delay(500);
}

int f = 1000, d = 1;

void loop() {
  if (Serial.available()) {
    char cmd = Serial.read();
    switch (cmd) {
      case 'f': f = serial_read_int(); Serial.print('f'); Serial.println(f); break;
      case 'd': d = serial_read_int(); Serial.print('d'); Serial.println(d); break;
      case 'b': beep(d, f); break;
    }
  }
  delay(100);
}
