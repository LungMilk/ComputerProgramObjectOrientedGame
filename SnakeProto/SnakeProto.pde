Snake snake = new Snake();

//the list is the recorded history for the single snake
ArrayList<PVector> snakelist = new ArrayList<PVector>();

int xDirect;
int yDirect;

void setup(){
  size(400,400);
  
}

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
