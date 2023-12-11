boolean colorChange;
boolean startState;
boolean endState;
boolean gameState;

int colorIndex;
int colorIndex2;

int winner;

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
int frequency = 500;

void setup(){
  size(400,400);
  timer = new Timer(frequency);
 //rework the colors or simply add different ones for each player
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

restart();
}

void restart(){
  winner = 0;
gameState = false;
endState = false;
startState = true;
colorIndex = 0;
colorIndex2 = 1;

for(int i = 0; i <foodList.size();i++){
  foodList.remove(i);
}
snake.restart();
snake2.restart();
  foodList.add(new Food());
  timer.start();
}
//issue with how the position is only snapshotted in time and stable
//possibility to instead have a list that removes the old one then replaces it at a closer position for each in the list
void draw(){
 if (startState){
   start.colorUpdate();
   start.display();
 }
 if (endState){
   end.display(winner);
 }
 if (gameState==true){
   
   if(winner>0){
    gameState=false;
    endState = true;
   }
   
   background(255);
   snake.move();
   snake2.move();
   snake.display(SnakeColors[colorIndex]);
   snake2.display(SnakeColor2[colorIndex2]);
 
 for (int i = 0;i <foodList.size();i++){
   Food f = foodList.get(i);
  f.display();
  
 if (snake.intersecting(foodList.get(i))){
   snake.bodylimit++;
   foodList.remove(i);
 }
 
 }
 for (int i = 0;i <foodList.size();i++){
 if (snake2.intersecting(foodList.get(i))){
   snake2.bodylimit++;
   foodList.remove(i);
 }
 }
 for (int i = 0; i< snake.bodylimit-1;i++){
   //this only works for the head of the snake
   if (snake2.intersectingSnakeBody(snake.snakelist.get(i), snake.size)){
     println("snake2 lost");
     winner = 1;
   }
   
 }
 
 for (int i = 0; i< snake2.bodylimit-1;i++){
   //this only works for the head of the snake
   if (snake.intersectingSnakeBody(snake2.snakelist.get(i), snake2.size)){
     println("snake 1 lost");
     winner = 2;
   }
   
 }
 
 if (timer.isFinished()==true){
   foodList.add(new Food()); 
   timer.start();
  }
 }
}


void keyPressed(){
  //println(key + ":" + keyCode);
  if (key=='1'){
    gameState = true;
  }
  
  snake.direction(keyCode);
  snake2.direction(keyCode);
  println("buttonpressed" + millis());
}

void keyReleased(){
  snake.stop(keyCode);
  snake2.stop(keyCode);
}
