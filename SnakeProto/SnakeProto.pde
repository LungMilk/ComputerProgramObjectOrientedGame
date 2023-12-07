//adding joystick funcitonality means that the player should be able to choose one or tow players

/*
major buttons 1,2 both start

3,4 could be maybe a short boost?

i think one player could have a snake that bounces off of the walls 

player 1 control scheme
up,left,right,down
*/

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
ArrayList<Food> foodList = new ArrayList<Food>();

color[] SnakeColors = new color[8];

Snake snake = new Snake(1);
Snake snake2 = new Snake(2);

endScreen end = new endScreen();
startScreen start = new startScreen();

//bouncing ball will be representative of the losers snake 

Timer timer;
int frequency = 2000;


void setup(){
  size(400,400);
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
   snake2.move();
 for (int i = 0;i <foodList.size();i++){
 if (snake.intersecting(foodList.get(i))){
   snake.bodylimit++;
   foodList.remove(i);
   println("YumYum");
 }
 }
 
 snake.display();
 snake2.display();
 
 //snake 2 will check its position against each snakes position in its history as well
 for (int i = 0; i< snake.bodylimit;i++){
   //this only works for the head of the snake
   if (snake2.intersectingSnakeBody(snake.snakelist.get(i), snake.size)){
     println("snake2 is over 1");
     //break is only from this block of code
    break; 
   }
   
 }
 
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
  //println(key + ":" + keyCode);
  
  if (key=='c'){
    colorChange = true;
  }
  if (key=='v'){
    gameState = true;
  }
  
  if (key==' '|| key=='='){
   
   //yh updown gj leftright
   
   snake.bodylimit++;
  }
  
  if (key == 'e'){
    startState = true;
    endState = false;
    gameState = false;
  }
  if (key== 't'){
    
    endState = true;
    startState = false;
    gameState = false;
  }
  if (key== 'w'){
    endState = false;
    startState = false;
    gameState = false;
  }
  snake.direction(keyCode);
  snake2.direction(keyCode);
  println("buttonpressed" + millis());
}

void keyReleased(){
  snake.stop(keyCode);
  snake2.direction(keyCode);
}
