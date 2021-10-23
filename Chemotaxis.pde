
Bacteria [] bacteriaGroup = new Bacteria [70];

void setup()   
{    
  size (700, 500);
  // initialize your variables here; what does frameRate do?
  for (int i = 0; i < bacteriaGroup.length; i++) {
    bacteriaGroup [i] = new Bacteria(); // fills in all 7 empty spaces with new bacteria
  }
}   

void draw()   
{    
  background (101, 117, 148);
  // for loop to go through array of new walking bacteria and 
  // then call the walk and show function inside the for loop
  for (int i = 0; i < bacteriaGroup.length; i++) {
    // fill (224, 204, 255);
    fill ((int)(Math.random()*50+201), 
    (int)(Math.random()*50+201), 
    (int)(Math.random()*50+201));
    
    bacteriaGroup[i].walk();
    bacteriaGroup[i].avoid();
    bacteriaGroup[i].show();
  }
}  

void mousePressed(){
  redraw();
}
class Bacteria    
{     
  int mySize, myX, myY;
  Bacteria() {
    myX = 350; // change numbers later
    myY = 350; // change numbers later
    mySize = 50;
  }
  void walk () {
    myX = myX + (int)(Math.random()*10)-5; // 10 and -5 determine how fast the dots move
    myY = myY + (int)(Math.random()*10)-5;
  }
  void show () {
    ellipse (myX, myY, mySize, mySize);
  }
  void avoid () {
    // if mouse is on left of balloon, walk right randomly
    if (mouseX - myX <= 0 && dist(myX, myY, mouseX, mouseY) <= mySize) { 
      // dist(myX, myY, mouseX, mouseY) <= mySize/2 + 20 -> decides the distance between the mouse and the dots
      myX = myX + (int)(Math.random()*30)-7;
    }
    // if mouse is on right of balloon, walk left randomly
    if (mouseY - myY >= 0 && dist(myX,myY,mouseX,mouseY) <= mySize){
      myY = myY + (int)(Math.random()*30)-7;
    }
  }
}  
