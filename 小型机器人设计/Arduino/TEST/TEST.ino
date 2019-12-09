#include <Servo.h>
Servo servo1; 
Servo servo2;
Servo servo3;
Servo servo4;
//int i = 0;
int i = 1500;
int temp1 = 1;
int temp2 = 1;
int temp;
int current1, current2,pen_current;
int dest1,dest2,pen_dest;
void setup() {
  servo1.attach(3);
  servo2.attach(11); 
  servo3.attach(10); 
  servo2.writeMicroseconds(0);
  servo1.writeMicroseconds(0);
  //servo4.writeMicroseconds(1600);
  //servo3.writeMicroseconds(1300);
  servo4.attach(5); 
  servo4.writeMicroseconds(1600);
  servo3.writeMicroseconds(1400);
  pen_lift();
  turnto(1500,1500);
  pen_down();
  turnto(1522,1530);
  turnto(1536,1553);
  turnto(1562,1556);
  turnto(1574,1586);
  turnto(1589,1572);
  turnto(1602,1598);
//  turnto(1610,1622);
//  turnto(1620,1638);
//  turnto(1636,1640);
//  turnto(1666,1644);
//  turnto(1683,1664);
//  turnto(1696,1673);
//  turnto(1710,1682);
//  turnto(1723,1691);
//  turnto(1732,1705);
//  turnto(1751,1714);
//  turnto(1771,1710);
//  turnto(1781,1725);
//  turnto(1789,1732);
//  turnto(1796,1746);
//  turnto(1811,1744);
//  turnto(1823,1747);
//  turnto(1838,1752);
//  turnto(1860,1768);
//  turnto(1883,1778);
//  turnto(1898,1770);
//  turnto(1901,1799);
  /////////////////////
//  turnto(1895,1802);
//  turnto(1887,1827);
//  turnto(1898,1850);
//  turnto(1890,1858);
//  turnto(1882,1885);turnto(1875,1907);turnto(1867,1921);turnto(1839,1947);turnto(1830,1948);turnto(1815,1970);turnto(1807,1987);turnto(1760,1991);turnto(1764,2003);
//  turnto(1755,2008);turnto(1739,1981);turnto(1716,1959);turnto(1711,1923);turnto(1699,1912);turnto(1683,1887);turnto(1675,1864);turnto(1659,1849);turnto(1659,1827);turnto(1640,1813);turnto(1632,1792);turnto(1623,1784);
//  turnto(1621,1770);turnto(1621,1762);turnto(1613,1741);turnto(1605,1734);
//  turnto(1598,1715);
//  turnto(1590,1705);
//  turnto(1583,1685);
//  turnto(1575,1671);
//  turnto(1567,1648);
//  turnto(1552,1621);turnto(1545,1598);
//  turnto(1534,1585);
//  turnto(1520,1570);
//  turnto(1522,1530);
//  turnto(1460,1460);
turnto(1450,1598);
turnto(1450,1400);

pen_lift();

}
void loop() {
  
}
int turnto(int des1, int des2){
  
  while(1){
if(des1>current1){current1+=1;servo1.writeMicroseconds(current1);delay(5);}
if(des1<current1){current1-=1;servo1.writeMicroseconds(current1);delay(5);}
if(des2>current2){current2+=1;servo2.writeMicroseconds(current2);delay(5);}
if(des2<current2){current2-=1;servo2.writeMicroseconds(current2);delay(5);}
if((current1==des1)&&(current2==des2)){break;}
  }
  
}
int pen_lift()
{
  while(1){
if(2000>pen_current){pen_current+=1;servo3.writeMicroseconds(pen_current);delay(1);}
if(2000<pen_current){pen_current-=1;servo3.writeMicroseconds(pen_current);delay(1);}

if((pen_current==2000)){break;}

  }
  
  }
  int pen_down()
{
  while(1){
if(1500>pen_current){pen_current+=1;servo3.writeMicroseconds(pen_current);delay(1);}
if(1500<pen_current){pen_current-=1;servo3.writeMicroseconds(pen_current);delay(1);}

if((pen_current==1500)){break;}

  }
  
  }    
