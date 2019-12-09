#include <SoftwareSerial.h>


float A,B,xx,yy;
int a;
void setup() {
  // Open serial communications and wait for port to open:
  Serial.begin(57600);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }
 Serial.println("Goodnight moon!");
 xx=10;
 yy=10;
A = 2*atan((20*yy + (xx*xx*sqrt((-(xx*xx + yy*yy)*(xx*xx + yy*yy - 400))))/(xx*xx + yy*yy) + (yy*yy*sqrt((-(xx*xx + yy*yy)*(xx*xx + yy*yy - 400))))/(xx*xx + yy*yy))/(xx*xx + 20*xx + yy*yy));
//A = 3.14;
//B = -2*atan((sqrt(-(xx*xx + yy*yy)*(xx*xx + yy*yy - 400)))/(xx*xx + yy*yy));
//B = 10*sin(1.57)+10*sin(-1.57);
B = 3333.14;
}

void loop() { // run over and over
 
  
  
//  if (Serial.available()) {
a = floor(A);
    Serial.print(B);
 // }
delay(1000);
}
