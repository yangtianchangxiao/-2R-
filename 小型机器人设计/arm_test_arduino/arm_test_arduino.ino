#include<Servo.h>
Servo arm1;
Servo arm2;
float sita1;
float sita2;
float sita1_now;
float sita2_now;
float x;
float y;
int i=0;
int times=20;
int L1=9;
int L2=11;
float pi=3.1416;
int target1=0;
int target2=0;
void line();
void triangle();
void setup() {
  // put your setup code here, to run once:
arm1.attach(9);
arm2.attach(10);
pinMode(11,OUTPUT);

  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:

/*line();
//delay(5000);
//delay(5000);*/
  
   
 sita1=82-69;
  sita2=115-124;
  for(i=0;i<times;i++)
  {
    arm1.write((int)(69+sita1/times*i));
    arm2.write((int)(124+sita2/times*i));
    delay(100);
  }
  /*
  sita1=98-82;
  sita2=131-115;
    for(i=0;i<times;i++)
  {
    arm1.write((int)(82+sita1/times*i));
    arm2.write((int)(115+sita2/times*i));
    delay(100);
  }
  sita1=81-98;
  sita2=142-131;
      for(i=0;i<times;i++)
  {
    arm1.write((int)(98+sita1/times*i));
    arm2.write((int)(131+sita2/times*i));
    delay(100);
  }
  sita1=69-81;
  sita2=124-142;
   for(i=0;i<times;i++)
  {
    arm1.write((int)(81+sita1/times*i));
    arm2.write((int)(142+sita2/times*i));
    delay(100);
  }*/
  /*void line();
  delay(5000);*/

}
void line()
{
  analogWrite(11,16);//pen down
  x=6;
  y=0;

  for (;x<=9;x=x+0.3)
  {
    sita2=acos((x*x+y*y-L1*L1-L2*L2)/2/L1/L2);   
    //sita2=sita2-pi;
    sita1=atan2(y,x)+atan2(L2*sin(3.1416-sita2),L1+L2*cos(3.1416-sita2));
    arm1.write((int)(sita1)/3.14*180);
    arm2.write((int)(sita2)/3.14*180);
    delay(200);
  }
  analogWrite(11,1);//pen up
}
void triangle()
{
   //analogWrite(11,19);//pen down
   x=6;
   y=6;
   
    
  for (;x<=9;x=x+0.5)
  {
    sita2=acos((x*x+y*y-L1*L1-L2*L2)/2/L1/L2); 
    sita1=atan2(y,x)+acos((x*x+y*y+L1*L1-L2*L2)/(2*L1*sqrt(x*x+y*y)));  
   // sita2=sita2-pi;
    //sita1=atan2(y,x)+atan2(L2*sin(3.1416-sita2),L1+L2*cos(3.1416-sita2));
    target1=(int)(sita1/3.14*180);
    target2=(int)(sita2/3.14*180);
    Serial.print(target1);
    Serial.println("next");
    Serial.print(target2);
    arm1.write(target1);
    arm2.write(target2);
    delay(500);  
  }
 // analogWrite(11,20);//pen up
  //delay(1000);
  //analogWrite(11,16);
  for(;y<=3;y=y+0.5)
  {
    sita2=acos((x*x+y*y-L1*L1-L2*L2)/2/L1/L2);   
    //sita2=sita2-pi;
    
    sita1=atan2(y,x)+acos((x*x+y*y+L1*L1-L2*L2)/(2*L1*sqrt(x*x+y*y))); 
    target1=(int)(sita1/3.14*180);
    target2=(int)(sita2/3.14*180);
    Serial.print(target1);
    Serial.println("next");
    Serial.print(target2);
    arm1.write(target1);
    arm2.write(target2);
    delay(500);
  }
  analogWrite(11,19);
  delay(1000);
  analogWrite(11,16);
  for(;y>=6;)
  {
    sita2=acos((x*x+y*y-L1*L1-L2*L2)/2/L1/L2);   
    //sita2=sita2-pi;
   sita1=atan2(y,x)+acos((x*x+y*y+L1*L1-L2*L2)/(2*L1*sqrt(x*x+y*y))); 
    target1=(int)(sita1/3.14*180);
    target2=(int)(sita2/3.14*180);
    Serial.print(target1);
    Serial.println("next");
    Serial.print(target2);
    arm1.write(target1);
    arm2.write(target2);
    y=y-0.3;
    x=x-0.3;
    delay(500);
  }
  analogWrite(11,19);
}
