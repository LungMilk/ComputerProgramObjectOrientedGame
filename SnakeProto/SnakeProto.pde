boolean colorChange;
boolean startState;
boolean endState;
boolean gameState;

boolean goUp;
boolean goDown;
boolean goLeft;
boolean goRight;

int colorIndex;

//the list is the recorded history for the single snake
ArrayList<PVector> snakelist = new ArrayList<PVector>();
ArrayList<Food> foodList = new ArrayList<Food>();

color[] SnakeColors = new color[8];

Snake snake = new Snake();
//Snake snake2 = new Snake();

endScreen end = new endScreen();
startScreen start = new startScreen();

Timer timer;
int frequency = 2000;


int xDirect;
int yDirect;
int bodylimit;

void setup(){
  size(400,400);
  snakelist.add(snake.position);
  foodList.add(new Food(1));
   timer = new Timer(frequency);
 timer.start();
 
 SnakeColors[0] = color(255,0,0);
SnakeColors[1] = color(255,0,180);
SnakeColors[2] = color(255,0,255);
SnakeColors[3] = color(0,0,255);
SnakeColors[4] = color(0,255,255);
SnakeColors[5] = color(0,255,0);
SnakeColors[6] = color(255,255,0);
SnakeColors[7] = color(255,180,0);
gameState = false;
endState = false;
startState = true;
}
//issue with how the position is only snapshotted in time and stable
//possibility to instead have a list that removes the old one then replaces it at a closer position for each in the list
void draw(){
 if (startState){
   start.colorUpdate();
   start.display();
 }
 if (endState){
   end.display();
 }
 if (gameState==true){
   background(255);
   snake.move();
 for (int i = 0;i <foodList.size();i++){
 if (snake.intersecting(foodList.get(i))){
   bodylimit++;
   foodList.remove(i);
   println("YumYum");
 }
 }
 snake.display();
 textSize(10);
 fill(0);
 text("x " + snake.position.x,100,100);
 text("y " + snake.position.y,100,105);
 
 if (timer.isFinished()==true){
   foodList.add(new Food(foodList.size())); 
   timer.start();
  }
  for (int i =0; i< foodList.size();i++){
  Food f = foodList.get(i);
  f.display();
  }
 }
 
}
void keyPressed(){
  if (key=='c'){
    colorChange = true;
  }
  if (key=='v'){
    gameState = true;
  }
  
  if (key==' '|| key=='='){
   
   //yh updown gj leftright
   
   bodylimit++;
   println(snakelist.size());
   println(bodylimit);
  }
  
  if (key == 'e'){
    startState = true;
    endState = false;
  }
  if (key== 's'){
    endState = true;
    startState = false;
  }
  if (key== 'r'){
    endState = false;
    startState = false;
  }
  switch(key){
    //question how could i handle movment for two characters as hard coded individuals for the joystick
    //have the keys as variables that are passed as parameters to the different entities as well as identity variable
    //have the goUp booleans handled in the =snake
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
