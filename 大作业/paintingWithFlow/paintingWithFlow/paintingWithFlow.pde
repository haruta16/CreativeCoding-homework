/*
* @Author: bit2atom | SJTU-ChinaGold DesignIntelligence
* @Email:  zhanglliqun@gmail.com
* @Date:   2022-09-28 09:19:16
* @brief
* @Last Modified by:   bit2atommac2019
* @Last Modified time: 2022-10-10 09:20:23
* @detail
*/
ArrayList<Particle> particles;
ArrayList<PImage> img;
int n, s, maxR;
int indexImg = 0;
float Nline,SizeLine;
float CenterX=0,CenterY=0;

PFont f;
void setup() {
  size(800, 800);
  background(#FFEDDA);
  smooth();

  n = 500;
  s = 20;
  maxR = height/2 - height/10;

  particles = new ArrayList<Particle>();

  img = new ArrayList<PImage>();

  img.add(loadImage("vallege.jpg"));
  //img.add(loadImage("colorBrushes.png"));
  //img.add(loadImage("colorHikking.png"));
  //img.add(loadImage("colorBlocks.png"));
  
  //滑块
   IniUI();
  //字体
  f = createFont("Tahoma", 24);
  textFont(f);
  
  //参数初始化
  CenterX=width/2;
  CenterY=height/2;
}

void draw() {
    //滑块
  SizeLine=hs1.update();
  Nline=hs2.update();
  n=int(map(Nline,0,100,500,10000));
  s=int(map(SizeLine,0,100,5,50));
  //println(SizeLine,Nline);
  hs1.display();
  hs2.display();
  text("line size",40, height-35);
  text("line number",width/2+40, height-35);
  
  pushMatrix();
  translate(width/2, height/2);
  noStroke();
  
  if (s > 1) {
    if (particles.size() != 0) {
      for (int i = 0; i < particles.size(); i++) {
        Particle p = particles.get(i);
        p.show();
        p.move();

        if (p.isDead()) particles.remove(i);
      }
    } else {
      s -= 2;
      initParticles();
    }
  }
  popMatrix();
  

}

void initParticles() {
  for (int i = 0; i < n; i++) {
    particles.add(new Particle(maxR, s));

    Particle p = particles.get(i);
    int x = int(map(p.pos.x, -maxR, maxR, 0, img.get(indexImg).width));
    int y = int(map(p.pos.y, -maxR, maxR, 0, img.get(indexImg).height));
    p.c = img.get(indexImg).get(x, y);
  }
}

void mousePressed() {
  //indexImg = (indexImg + 1) % img.size();
  //setup();
  if(mouseY>50&&mouseY<height-50){
  CenterX=mouseX-width/2;
  CenterY=mouseY-height/2;
  //fill(#FFEDDA);
  //rect(0,0,width,height);
  }
  
}
