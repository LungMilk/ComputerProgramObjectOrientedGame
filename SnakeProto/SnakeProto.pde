Snake snake = new Snake();
ArrayList<Snake> snakelist = new ArrayList<Snake>();

int xDirect;
int yDirect;

void setup(){
  size(400,400);
  
}

void draw(){
 background(255);
 snake.display();
 snake.move();
 yDirect = 0;
 xDirect = 0;
}
void keyPressed(){
  snake.direction(key);
  if (key==' '){
   //increase add an object to the snake array list
   snakelist.add(new Snake());
   println(snakelist.size());
  }
}
void keyReleased(){
  snake.stop(key);
}
