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
int colorIndex2;

//the list is the recorded history for the single snake
ArrayList<Food> foodList = new ArrayList<Food>();

color[] SnakeColors = new color[8];
color[] SnakeColor2 = new color[8];


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

SnakeColor2[0] = color(255,0,0);
SnakeColor2[1] = color(255,0,180);
SnakeColor2[2] = color(255,0,255);
SnakeColor2[3] = color(0,0,255);
SnakeColor2[4] = color(0,255,255);
SnakeColor2[5] = color(0,255,0);
SnakeColor2[6] = color(255,255,0);
SnakeColor2[7] = color(255,180,0);

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
   snake.display(SnakeColors[colorIndex]);
   snake2.display(SnakeColor2[colorIndex2]);
 
 
 for (int i = 0;i <foodList.size();i++){
 if (snake.intersecting(foodList.get(i))){
   snake.bodylimit++;
   foodList.remove(i);
   println("YumYum");
 }
 }
 for (int i = 0;i <foodList.size();i++){
 if (snake2.intersecting(foodList.get(i))){
   snake2.bodylimit++;
   foodList.remove(i);
   println("YumYum");
 }
 }
 for (int i = 0; i< snake.bodylimit-1;i++){
   //this only works for the head of the snake
   if (snake2.intersectingSnakeBody(snake.snakelist.get(i), snake.size)){
     println("snake2 lost");
     stop();
   }
   
 }
 
 for (int i = 0; i< snake2.bodylimit-1;i++){
   //this only works for the head of the snake
   if (snake.intersectingSnakeBody(snake2.snakelist.get(i), snake2.size)){
     println("snake 1 lost");
     stop();
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
  snake2.stop(keyCode);
}
