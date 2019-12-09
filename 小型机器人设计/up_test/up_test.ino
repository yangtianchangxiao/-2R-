#include<Servo.h>
Servo up;
int i=90;
void setup() {
  // put your setup code here, to run once:
up.attach(10);
}

void loop() {
  // put your main code here, to run repeatedly:

for(;i<120;i++)
{
  up.write(i);
  delay(100);
}


  
}
