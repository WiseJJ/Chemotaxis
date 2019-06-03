//declare bacteria variables here   
Bacteria bact;
Bacteria[] manyBact;
boolean noLigma = false;
boolean justRan = false;
void setup()   
{ 
  bact = new Bacteria();
  manyBact = new Bacteria[5];
  size(600, 600);
  background(0);
  for (int i=0; i<manyBact.length; i++)
    manyBact[i]=new Bacteria();
  //initialize bacteria variables here
}   

void draw()   
{ 
  clear();
  if (noLigma==false) {
    for (int i =0; i<manyBact.length; i++) {
      manyBact[i].move();
      manyBact[i].show();
    }
  }

  if (noLigma) {
    for (int k =0; k<manyBact.length; k++) {
      manyBact[k].moveOut();
      manyBact[k].show();
    }
    for (int l =0; l<manyBact.length; l++) {
      if (manyBact[l].hasarrived()== false) {
        justRan= false;
        noLigma= true;
        break;
      } else {
        justRan=true;
        noLigma= false;
      }
    }
  }
  if (justRan) {
    for (int i =0; i<manyBact.length; i++) {
      manyBact[i].setA();
      manyBact[i].changeSide();
    }
  }
}
void mousePressed()
{
  noLigma= true;
}
void keyPressed() {
  if (key == CODED) {

    if (keyCode == UP) {
      for (int m =0; m<manyBact.length; m++) {
        manyBact[m].uKey();
      }
      noLigma = true;
    }
    if (keyCode == DOWN) {
      for (int n =0; n<manyBact.length; n++) {
        manyBact[n].dKey();
      }
      noLigma = true;
    }
    if (keyCode == LEFT) {
      for (int o =0; o<manyBact.length; o++) {
        manyBact[o].lKey();
      }
      noLigma = true;
    }
    if (keyCode == RIGHT) {
      for (int k =0; k<manyBact.length; k++) {
        manyBact[k].rKey();
      }
      noLigma = true;
    }
  }
}
//move and show the bacteria   


class Bacteria  
{ 
  boolean arrive = false;
  int side = (int)(Math.random()*4+1);
  int bx = (int)(Math.random()*601);
  int by = (int)(Math.random()*601);
  int w = (int)(Math.random()*20 +40);
  int c1= (int)(Math.random()*256);
  int c2= (int)(Math.random()*256);
  int c3= (int)(Math.random()*256);
  public Bacteria() {
  }
  void move() {
    if (mouseX>bx) {
      bx+=(int)(Math.random()*11-3);
    }
    if (mouseX<bx) {
      bx-=(int)(Math.random()*10-3);
    }
    if (mouseY>by) {
      by+=(int)(Math.random()*11-3);
    }
    if (mouseY<by) {
      by-=(int)(Math.random()*11-3);
    }
  }
  void moveOut() {
    if (side==1) {

      if (by>0) {
        bx+= (int) (Math.random()*17 -8);
        by+= (int) (Math.random()*17-15);
      } else {
        arrive = true;
        by = 10;
      }
    }
    if (side==2) {
      if (bx<600) {
        bx+= (int) (Math.random()*17-2);
        by+= (int) (Math.random()*17 -8);
      } else {
        arrive = true;
        bx = 590;
      }
    }
    if (side==3) {
      if (by<600) {
        bx+= (int) (Math.random()*17 -8);
        by+= (int) (Math.random()*17-2);
      } else {
        arrive = true;
        by = 590;
      }
    }
    if (side==4) {
      if (bx>0) {
        bx+= (int) (Math.random()*17-15);
        by+= (int) (Math.random()*17 -8);
      } else {
        arrive = true;
        bx = 10;
      }
    }
  }
  void show() {

    fill(c1, c2, c3);
    ellipse(bx, by, w, w);
    textSize(15);
    fill(255);
    text("virus", bx-20, by+5);
  }
  boolean hasarrived() {
    return arrive;
  }
  void setA() {
    arrive=false;
  }
  void changeSide() {
    side= (int)(Math.random()*4+1);
  }
  void lKey() {
    side = 4;
  }
  void rKey() {
    side =2;
  }
  void uKey() {
    side =1;
  }
  void dKey() {
    side =3;
  }
}    