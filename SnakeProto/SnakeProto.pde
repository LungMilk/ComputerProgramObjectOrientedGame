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

BouncingBall BBall = new BouncingBall(10);

Timer timer;
int frequency = 2000;


int xDirect;
int yDirect;
int bodylimit;

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
   println("endscreem");
   end.display();
 }
 if (gameState==true){
   background(255);
   snake.move();
   snake2.move();
 for (int i = 0;i <foodList.size();i++){
 if (snake.intersecting(foodList.get(i))){
   bodylimit++;
   foodList.remove(i);
   println("YumYum");
 }
 }
 //currently they both exist over one another
 snake.display();
 snake2.display();
 textSize(10);
 fill(0);
 text("x " + snake2.position.x,100,100);
 text("y " + snake2.position.y,100,105);
 
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
   println(snake2.snakelist.size());
   println(bodylimit);
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
  if (key== 'r'){
    endState = false;
    startState = false;
    gameState = false;
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
