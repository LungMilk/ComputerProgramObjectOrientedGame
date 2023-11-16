Snake snake = new Snake();

//the list is the recorded history for the single snake
ArrayList<PVector> snakelist = new ArrayList<PVector>();

int xDirect;
int yDirect;

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
 
}
void keyPressed(){
  snake.direction(key);
  if (key==' '){
   //increase add an object to the snake array list
   //not recording the history of the positions 
   snake.grow();
   println(snakelist.size());
  }
}
void keyReleased(){
  snake.stop(key);
}
