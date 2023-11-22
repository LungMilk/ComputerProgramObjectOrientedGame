Snake snake = new Snake();
Snake snake2 = new Snake();
boolean goUp;
boolean goDown;
boolean goLeft;
boolean goRight;

//the list is the recorded history for the single snake
ArrayList<PVector> snakelist = new ArrayList<PVector>();

int xDirect;
int yDirect;
int bodylimit;

void setup(){
  size(400,400);
  snakelist.add(snake.position);
}
//issue with how the position is only snapshotted in time and stable
//possibility to instead have a list that removes the old one then replaces it at a closer position for each in the list
void draw(){
 background(255);
 snake.move();
 snake.display();
 textSize(10);
 fill(0);
 text("x " + snake.position.x,100,100);
 text("y " + snake.position.y,100,105);
 //delay the tail to have more segmented look
}
void keyPressed(){
  if (key==' '|| key=='='){
   //increase a variable that controls how long the circles are being drawn
   //
   
   //yh updown gj leftright
   
   bodylimit++;
   println(snakelist.size());
   println(bodylimit);
  }
  
  switch(key){
    //question how could i handle movment for two characters as hard coded individuals for the joystick
   case 'w':
   goUp = true;
     break;
     
    case's':
    goDown = true;
    break;
    
    case 'a':
    goLeft = true;
     break;
     
     case 'd':
   goRight = true;
     break;
  }
}
void keyReleased(){
  switch(key){
   case 'w':
   goUp = false;
     break;
     
    case's':
    goDown = false;
    break;
    
    case 'a':
    goLeft = false;
     break;
     
     case 'd':
   goRight = false;
     break;
  }
}
