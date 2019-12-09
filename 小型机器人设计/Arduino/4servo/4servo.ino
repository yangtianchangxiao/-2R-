 #include <Servo.h>
Servo servo1;
Servo servo2;
Servo servo3;
Servo servo4;
int i = 1500;
int temp1 = 1;
int temp2 = 1;
int temp;
int current1, current2,pen_current;
int dest1,dest2,pen_dest;
void setup() {
  // put your setup code here, to run once:
  servo1.attach(3);
  servo2.attach(11);
  servo3.attach(10);
  servo4.attach(5);
  Serial.begin(57600);
   while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }


  Serial.println("Goodnight moon!");
current1=dest1=1500;
current2=dest2=1500;
servo1.writeMicroseconds(1500);
servo2.writeMicroseconds(1500);
//servo3.writeMicroseconds(1990);
servo4.writeMicroseconds(1600);
//pen_current=1880;
//pen_lift(pen_current);
servo3.writeMicroseconds(1300);
delay(2000);



}

void loop() {
temp=Serial.read();
if(temp=='A')
{dest1 =dest1 + 1;
Serial.print(dest1);}

if(temp=='Z')
{dest1 -= 1;
Serial.print(dest1);
}
if(temp=='K')
{dest2 += 1;
Serial.print(dest2);
}
if(temp=='L')
{dest2 -= 1;
Serial.print(dest2);}
turnto(dest1,dest2);
//servo1.writeMicroseconds(dest1);
//servo2.writeMicroseconds(dest2);
}

int turnto(int des1, int des2){
  
  while(1){
if(des1>current1){current1+=1;servo1.writeMicroseconds(current1);delay(1);}
if(des1<current1){current1-=1;servo1.writeMicroseconds(current1);delay(1);}
if(des2>current2){current2+=1;servo2.writeMicroseconds(current2);delay(1);}
if(des2<current2){current2-=1;servo2.writeMicroseconds(current2);delay(1);}
if((current1==des1)&&(current2==des2)){break;}
  }
  
}

int pen_lift()
{
  while(1){
if(des>pen_current){pen_current+=1;servo3.writeMicroseconds(pen_current);delay(1);}
if(des<pen_current){pen_current-=1;servo3.writeMicroseconds(pen_current);delay(1);}

if((pen_current==des)){break;}

  }
  
  }  
