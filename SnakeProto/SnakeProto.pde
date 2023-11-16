Snake snake = new Snake();

//the list is the recorded history for the single snake
ArrayList<PVector> snakelist = new ArrayList<PVector>();

int xDirect;
int yDirect;
int bodylimit;

void setup(){
  size(400,400);
  snakelist.add(snake.positionSnake);
}
//issue with how the position is only snapshotted in time and stable
//possibility to instead have a list that removes the old one then replaces it at a closer position for each in the list
void draw(){
 background(255);
 snake.display();
 snake.move();
 
 //delay the tail to have more segmented look
}
void keyPressed(){
  snake.direction(key);
  if (key==' '|| key=='='){
   //increase a variable that controls how long the circles are being drawn
   //
   bodylimit++;
   println(snakelist.size());
  }
}
void keyReleased(){
  snake.stop(key);
}
