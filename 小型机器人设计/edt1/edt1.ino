#include<Servo.h>
#include<time.h>
#define L1 11
#define L2 9
float x;
float y;
int sita1;
int sita2;
Servo arm1;
Servo arm2;

void setup() {
  // put your setup code here, to run once:
  arm1.attach(9);
  arm2.attach(10);
  pinMode(3,OUTPUT);//up
  pinMode(5,OUTPUT);//hold

}



void loop() {
  // put your main code here, to run repeatedly:
  //draw a line


}
void draw_line()
{
  float line_x=0;
  float line_y=0;
  int i=0;
  for(;i<100;i++)
  {
    x=i*0.09;
    draw(x,y);
  }
}
void draw_circle()
{
  float line_x=0;
  float line_y=0;
  int i=0;
  for(;i<360;i++)
  {
    x=3+3*cos(i);
    y=3+3*sin(i);
    draw(x,y);
  }
     
}
void draw(float x,float y)
{
    sita2=acos((x*x+y*y-L1*L1-L2*L2)/2*L1*L2);//0-pi
    sita2=180-sita2;//转变到舵机的角度象限
    sita1=atan2(y,x)-atan2(L2*sin(sita2),L1+L2*cos(sita2));
    arm1.write(sita1);
    arm2.write(sita2);  
  }
  
  
  
