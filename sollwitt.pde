//设定变量
float xa1, ya1=0;
float xa2, ya2=0;
float xb1, yb1=0;
float xb2, yb2=0;
float x, y, c=0;

float ran1=10;
float ran2=1;


float speedX=1; 
float speedY=1;


//设定背景和帧速率
void setup() {
  size(800, 800);
  background(0);
  frameRate(500);
}



void draw() {
  //画图的开始与结束条件，开始时间
  if (x<width-width/8 && y<height-height/8 && frameCount>5000) {
    lineX();
    lineY();
  }
}


//横向的随机线条
void lineX() {
  stroke(xa1*255/width, ya1*255/height, c);//设定线条颜色规则
  line(xa1, ya1, xa2, ya2);

  c=sqrt((xa2-xa1)*(xa2-xa1)+(ya2-ya1)*(ya2-ya1));
  xa1=xa2;
  ya1=ya2;
  xa2=xa1+random(ran1);//线条延伸方向的随机数为正
  ya2=ya1+random(-ran2, ran2);

  if (xa1>width) {
    y=y+speedY;
    xa1=0;
    ya1=y;
    xa2=xa1;
    ya2=ya1;
  }

  if (y>=height) {
    xa1=1;
    xa2=1;
    ya1=1;
    ya2=1;
  }
}


//竖向的随机线条
void lineY() {
  stroke(c, xb1*255/width, yb1*255/height);
  line(xb1, yb1, xb2, yb2);
  c=sqrt((xb2-xb1)*(xb2-xb1)+(yb2-yb1)*(yb2-yb1));
  xb1=xb2;
  yb1=yb2;
  xb2=xb1+random(-ran2, ran2);
  yb2=yb1+random(ran1);

  if (yb1>height) {
    x=x+speedX;
    yb1=0;
    xb1=x;
    xb2=xb1;
    yb2=yb1;
  }
}
