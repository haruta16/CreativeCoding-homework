float t=0;
myShpere[] spheres=new myShpere[100];
void setup()
{
  size(1400, 1400);
  for (int i= 0; i<spheres.length; i++)
  {
    myShpere t=new myShpere();
    t.draw();
    spheres[i]=t;
  }
}
void draw()
{
  background(#050505);
  for (int i= 0; i<spheres.length; i++)
  {
    spheres[i].checkdis(spheres, i);
  }
}
