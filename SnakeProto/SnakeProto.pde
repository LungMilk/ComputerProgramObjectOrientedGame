/*untitled snake game 
eat as much food as possible and then eat your friend 
try to trap them off with your tail to win
*/

//booleans that determine game state
boolean startState;
boolean endState;
boolean gameState;

//seperate index's to determine the players color of choice for both players
int colorIndex;
int colorIndex2;
//arrays of different player appearance options
color[] SnakeColors = new color[8];
color[] SnakeColor2 = new color[8];

//list of objects that manages the foods properties
ArrayList<Food> foodList = new ArrayList<Food>();
//intitialize the seperate player objects and pass them their respective identities
Snake snake = new Snake(1);
Snake snake2 = new Snake(2);
//determines the winners identity
int winner;
//intitialize the end and startscreen objects
endScreen end = new endScreen();
startScreen start = new startScreen();
//intitialize the timer to act as the spawn manager of food
Timer timer;
int frequency = 500;

void setup(){
  //establish size of canvas for project
  //the numbers are then assigned to height and width to be constant throughout the program
  size(400,400);
  //initialize the timer object while passing it the frequency of the spawn rates for the food
  timer = new Timer(frequency);
  //array of the color values for both players in seperate arrays
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
//having all the variables reset to default states in restart allows for the program to be replayable
restart();
}

void restart(){
  //reset system wide variables to default states
  winner = 0;
gameState = false;
endState = false;
startState = true;
colorIndex = 0;
colorIndex2 = 1;
//remove each object in the food list 
for(int i = 0; i <foodList.size();i++){
  foodList.remove(i);
}
//each snake is responsible for its own properties 
//reestart the snakes internal values
snake.restart();
snake2.restart();
//add a foodlist so there is always 1 on startup 
  foodList.add(new Food());
  //start the timer so more can spawn
  timer.start();
}

void draw(){
  //conditional statements to determine and draw the respective states each draw loop (Frame)
 if (startState){
   //color update controls the change of the startscreen with the snakeColor array so it can change depending on the players input
   start.colorUpdate();
   start.display();
 }
 if (endState){
   //end screen is displayed and passed the identity of the winner for text and stats in the game
   end.display(winner);
 }
 //draw all the gameplay
 if (gameState==true){
   //checks on the next loop of gameplay being true that the game ends once winner identified
   if(winner>0){
    gameState=false;
    endState = true;
   }
   background(255);
   //update the snakes positions and display them passing their selected color index from the start screen so they are drawn with their colors
   snake.move();
   snake2.move();
   snake.display(SnakeColors[colorIndex]);
   snake2.display(SnakeColor2[colorIndex2]);
 //loop that displays each item in the foodlist depending on th eindex
 for (int i = 0;i <foodList.size();i++){
   //gets the repective object in the list at position i and declare it as f with f then displaying the object
   Food f = foodList.get(i);
  f.display();
  //the above block of text was moved into the intersection check as it was seperated in the same for loop
  
  //calls on snake 1s function to check if it is intersecting which returns a boolean value
 if (snake.intersecting(foodList.get(i))){
   //if the check is true the snake eats the food increasing its size and removing the food from the list
   snake.bodylimit++;
   foodList.remove(i);
 }
 }
 //same loop but for player 2 (snake2)
 for (int i = 0;i <foodList.size();i++){
 if (snake2.intersecting(foodList.get(i))){
   snake2.bodylimit++;
   foodList.remove(i);
 }
 }
 //these for loops check if the snakes are intersecting over their previosu positions 
 //having it check only previous position allows for the players to not immedately win on startup incase they spawn on each other
 for (int i = 0; i< snake2.bodylimit-1;i++){
   if (snake.intersectingSnakeBody(snake2.snakelist.get(i), snake2.size)){
     //println tells identifys the player to the console
     println("snake 1 lost");
     //program variable is given the identity
     winner = 2;
   }
   
 }
 //same as previous check but for snake 2/player 2
 for (int i = 0; i< snake.bodylimit-1;i++){
   if (snake2.intersectingSnakeBody(snake.snakelist.get(i), snake.size)){
     println("snake2 lost");
     winner = 1;
   }
   
 }
 
 //once timer is finished a new food is added to the foodlist arrayList as well the timer starts again
 if (timer.isFinished()==true){
   foodList.add(new Food()); 
   timer.start();
  }
 }
}


void keyPressed(){
  //println(key + ":" + keyCode);
  //on startup pressing 1 starts the game
  if (key=='1'){
    gameState = true;
  }
  //due to the arcade cabinet control scheme keycode was used so the arrow keys could work 
  //the snakes each have a function that is passed the key code then determined which way they travel depending on identity
  snake.direction(keyCode);
  snake2.direction(keyCode);
}

void keyReleased(){
  //same as direction but negates the movement of the input for each key
  snake.stop(keyCode);
  snake2.stop(keyCode);
}
