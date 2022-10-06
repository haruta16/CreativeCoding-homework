//设定变量
int num=20;
float speed=2;
float k=0;
PVector[] point=new PVector[num];
PVector[] pointl=new PVector[num];
float[]r=new float[num];
float[]g=new float[num];
float[]b=new float[num];
float[]p=new float[num];
float[]w=new float[num];


void setup() {
  size(800, 800);
  frameRate(30);
  background(255);
  newdate();
}


void draw() {   
  //程序开始条件与先后顺序
  if (frameCount>300) {
    huarect();
  }
  if (k==100) {
    hualine();
  }
}


//初始化
void newdate() {
  for (int i=0; i<num; i++) {

    r[i]=random(0, 100);
    g[i]=random(0, 100);
    b[i]=random(0, 100);
    rgb();
    w[i]=random(1, 8);

    point[i]=new PVector(random(0, width), random(0, height));
    pointl[i]=new PVector(random(0, 150), random(0, 150));

    p[i]=0;
  }
}



//画方形
void huarect() {
  for (int j=0; j<num; j++) {

    fill(r[j], g[j], b[j], k);
    strokeWeight(5);
    stroke(0, 0, 0, k);
    rect(point[j].x, point[j].y, pointl[j].x, pointl[j].y);
  }
  if (k<100) {
    k=k+speed/4;
  }
}



//画线
void hualine() {
  for (int i=0; i<num; i++) {
    if (p[i]<width/2) {
      strokeWeight(w[i]);
      fill(0);
      line(point[i].x-p[i], point[i].y, point[i].x+p[i], point[i].y);
      line(point[i].x, point[i].y-p[i], point[i].x, point[i].y+p[i]);
      p[i]=p[i]+speed;
    }
  }
}


//颜色随机规则
void rgb() {
  for (int i=0; i>num; i++) {
    if (r[i]>g[i] && r[i]>b[i]) {
      g[i]=g[i]/100; 
      b[i]=b[i]/100;
    } else if (g[i]>r[i] && g[i]>b[i]) {
      r[i]=r[i]/100; 
      b[i]=b[i]/100;
    } else if (b[i]>r[i] && b[i]>g[i]) {
      r[i]=r[i]/100; 
      g[i]=g[i]/100;
    }
  }
}
