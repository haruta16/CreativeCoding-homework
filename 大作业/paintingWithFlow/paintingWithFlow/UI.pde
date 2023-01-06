import controlP5.*;
ControlP5 cp5;
HScrollbar hs1, hs2;  // Two scrollbars


void IniUI(){
   hs1 = new HScrollbar(0, height-20, width/4, 16, 16);
   hs2 = new HScrollbar(width/2, height-20, width/4, 16, 16);
    noStroke();
   cp5 = new ControlP5(this);
   
    cp5.addButton("Select")
     .setValue(0)
     .setPosition(100,10)
     .setSize(100,20)
     ;
     cp5.addButton("Save")
     .setValue(0)
     .setPosition(width/2,10)
     .setSize(100,20)
     ;
}

public void controlEvent(ControlEvent theEvent) {
  //println(theEvent.getController().getName());
}

public void Select(int theValue) {
  println("a button event from Select: "+theValue);
  if(cp5.isMouseOver(cp5.getController("Select")))
  selectInput("Select a file to process:", "fileSelected");
}


public void Save(int theValue) {
  println("a button event from Save: "+theValue);
    saveFrame(second()+".jpg");
}
class HScrollbar {
  int swidth, sheight;    // width and height of bar
  float xpos, ypos;       // x and y position of bar
  float spos, newspos;    // x position of slider
  float sposMin, sposMax; // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;

  HScrollbar (float xp, float yp, int sw, int sh, int l) {
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos + swidth/2 - sheight/2;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = l;
  }

  float update() {
    if (overEvent()) {
      over = true;
    } else {
      over = false;
    }
    if (mousePressed && over) {
      locked = true;
    }
    if (!mousePressed) {
      locked = false;
    }
    if (locked) {
      newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
    }
    if (abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
    
    float value=map((spos-xpos)/swidth,0,1,0,100);
    return value;
  }

  float constrain(float val, float minv, float maxv) {
    return min(max(val, minv), maxv);
  }

  boolean overEvent() {
    if (mouseX > xpos && mouseX < xpos+swidth &&
       mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    
    noStroke();
    //rect(xpos, ypos, swidth, sheight);
    fill(255,153,18);
    rect(xpos, ypos, spos-xpos, sheight);
    fill(204);
    rect(spos, ypos, swidth-(spos-xpos), sheight);
    if (over || locked) {
      fill(0, 0, 0);
    } else {
      fill(102, 102, 102);
    }
    rect(spos, ypos, sheight, sheight);
  }

  float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    return spos * ratio;
  }
}

void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    String theNameThatHasBeenEntered  = selection.getAbsolutePath();
    img.remove(0);
    img.add(loadImage( theNameThatHasBeenEntered ));

  }
}
