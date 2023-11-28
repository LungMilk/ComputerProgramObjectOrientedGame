Snake snake = new Snake();
Snake snake2 = new Snake();

endScreen end = new endScreen();
startScreen start = new startScreen();

boolean startState;
boolean endState;

boolean goUp;
boolean goDown;
boolean goLeft;
boolean goRight;

//the list is the recorded history for the single snake
ArrayList<PVector> snakelist = new ArrayList<PVector>();
ArrayList<Food> foodList = new ArrayList<Food>();

color[] SnakeColors = new color[8];


Timer timer;
int frequency = 2000;


int xDirect;
int yDirect;
int bodylimit;

/*
milestone 2 
-intersections of the snake with the food -Done
-checks for the end state and starting state
-link food amount to the food eaten
-add menu screen and end screen

Problem 
-the only way to have an end state is to have an instance where the player dies to the other player
I could have it in such a way that the snakelist(0) is the only one checked against the other entity so maybe i could have either barriers to avoid 
or the other player could be the instance
-food could get the player so large they take up the whole screen as it is both width and length but width is more noticable
to do so we must do what
create the snake controls to be managed by either player 1 or 2 and give them identities
--hard to see the direction the player is going 
add an arrow or face that always positions themselves in teh direction opposite the previous position or rotates depending on the direction
*/

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
}
//issue with how the position is only snapshotted in time and stable
//possibility to instead have a list that removes the old one then replaces it at a closer position for each in the list
void draw(){
 background(255);
 if (startState){
   start.display();
 }
 if (endState){
   end.display();
 }
 else{
   
 }
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
void keyPressed(){
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
