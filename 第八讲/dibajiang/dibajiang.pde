
float angle=0;
int w=80;
int clos;
int rows;
Curve[][] curves;

void setup() {
  size(800, 800);
  clos=width/w-1;
  rows=height/w-1;
  curves=new Curve[rows][clos];


  for (int j=0; j<rows; j++) {
    for (int i=0; i<clos; i++) {
      curves[j][i]=new Curve();
    }
  }
}



void draw() {
  background(0);
  float d=w-10;
  float r=d/2;


  noFill();
  stroke(255);
  for (int i=0; i<clos; i++) {
    float cx=w+i*w+w/2;
    float cy=w/2;


    strokeWeight(1);
    stroke(255);
    ellipse(cx, cy, d, d);
    float x=r*cos(angle*(i+1)-PI/2);
    float y=r*sin(angle*(i+1)-PI/2);
    strokeWeight(8);
    stroke(255);
    point(cx+x, cy+y);

    stroke(255, 50);
    strokeWeight(1);
    line(cx+x, 0, cx+x, height);
    
    
    for(int j=0;j<rows;j++){
      curves[j][i].setX(cx+x);
    }
  }

  noFill();
  stroke(255);
  for (int j=0; j<rows; j++) {
    float cy=w+j*w+w/2;
    float cx=w/2;


    strokeWeight(1);
    stroke(255);
    ellipse(cx, cy, d, d);
    float x=r*cos(angle*(j+1)-PI/2);
    float y=r*sin(angle*(j+1)-PI/2);
    strokeWeight(8);
    stroke(255);
    point(cx+x, cy+y);

    stroke(255, 50);
    strokeWeight(1);
    line(0, cy+y, width, cy+y);
    
     for(int i=0;i<rows;i++){
      curves[j][i].setY(cy+y);
    }
  }


  for (int j=0; j<rows; j++) {
    for (int i=0; i<clos; i++) {
      curves[j][i].addPoint();
      curves[j][i].show();
    }
  }

  angle +=0.01;
}
