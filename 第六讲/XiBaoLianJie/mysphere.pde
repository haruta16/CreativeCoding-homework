class myShpere
{
  color c;
  float posX, posY, radios, forcex, forcey;
  myShpere()
  {
    c=color(random(0, 255), random(0, 255), random(0, 255));
    forcex=random(-1, 1);
    forcey=random(-1, 1);
    posX=random(0, width);
    posY=random(0, height);
    radios=random(20, 40);
  }
  void draw()
  {
    fill(c);
    stroke(0);
    ellipse(posX, posY, radios, radios);
    posX+=forcex;
    posY+=forcey;
    if (posX>width)
    {
      posX-=width;
    } else  if (posX<0)
    {
      posX+=width;
    }
    if (posY>height)
    {
      posY-=height;
    } else if (posY<0)
    {
      posY+=height;
    }
  }

  void TurnRound(float x, float y)
  {
    forcex=x;
    forcey=y;
  }
  void checkdis(myShpere[] sphers, int id)
  {
    draw();
    if (id==1)
      println(forcex);
    for (int i= 0; i<spheres.length; i++)
    {

      if (id!=i)
      {
        checkdis(sphers[id], sphers[i]);
      }
    }
  }
  void checkdis(myShpere t1, myShpere t2)
  {
    float dis =dist(t1.posX, t1.posY, t2.posX, t2.posY);
    float disrad=t1.radios/2+t2.radios/2;
    if (dis>disrad&&dis<disrad*3)
    {

      stroke(t1.c);
      strokeWeight(3);
      line(t1.posX, t1.posY, t1.posX+(t2.posX-t1.posX)/2, t1.posY+(t2.posY-t1.posY)/2);
      stroke(t2.c);
      strokeWeight(3);
      line(t2.posX, t2.posY, t2.posX+(t1.posX-t2.posX)/2, t2.posY+(t1.posY-t2.posY)/2);
    } else 
    if (dis<disrad&&dis>0)
    {
      t1.TurnRound(t1.forcex*-1, t1.forcey*-1);
      t2.TurnRound(t2.forcex*-1, t2.forcey*-1);
    }
  }
}
