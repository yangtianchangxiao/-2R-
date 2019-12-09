 #include <Servo.h>
Servo servo1;
Servo servo2;int i = 1500;
int temp1 = 1;
int temp2 = 1;
int temp;
int current1, current2,pen_current;
int dest1,dest2,pen_dest;



void setup() {
  // put your setup code here, to run once:
  servo1.attach(3);
  servo2.attach(11);
 // servo3.attach(10);
  //servo4.attach(5);
  turnto(1000,1000);
  turnto(2500,2500);
}

void loop() {
  // put your main code here, to run repeatedly:

}

int turnto(int des1, int des2){
  
  while(1){
if(des1>current1){current1+=2;servo1.writeMicroseconds(current1);delay(5);}
if(des1<current1){current1-=2;servo1.writeMicroseconds(current1);delay(5);}
if(des2>current2){current2+=3;servo2.writeMicroseconds(current2);delay(5);}
if(des2<current2){current2-=3;servo2.writeMicroseconds(current2);delay(5);}
if((current1==des1)&&(current2==des2)){break;}
  }
  
}
