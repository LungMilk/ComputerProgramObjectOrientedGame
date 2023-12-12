class Snake{
  //arraylist of PVectors tthat holds the information of the snakes previous positions as a history
  ArrayList<PVector> snakelist = new ArrayList<PVector>();
  //body limit is the length or limit of snake segments drawn 
  int bodylimit;
  //positon and velocity are changes as the snake can move over multiple axis
  //as well to allow for vector specific modification of their values
  PVector position;
  PVector velocity;
  int size;

  //direction controls the direction with - to + values
  float directionX = 0;
  float directionY = 0;
  int speed = 5;
  //the identity of the snake
  int identity;
  //on initialization the snake recieves its identity and sets its variables with teh reset function
  Snake(int p){
    identity = p;
    restart();
  }
  
  void restart(){
    //sets its position to a random static position on the screen
    velocity = new PVector(0,0);
    position = new PVector(random(width), random(height));
    //returns bodylimit to drawn the head segment
    bodylimit =1;
    //removes the saved positions in the snake list for replayability
    for (int i =0; i< snakelist.size();i++){
      snakelist.remove(i);
    }
  }
  //displays the entire graphic informatino of the snake
  void display(color snakeColor){
    //declares its current position to a position in snake history
    PVector positionSnakeHistory = new PVector (position.x,position.y);
    //adds the vector to the list
    snakelist.add(positionSnakeHistory);
    //if the size ecxeeds the body limit remove the oldest position so more can be added
    if (snakelist.size()>bodylimit){
     snakelist.remove(0); 
    }
    //for loop that draws each segment of the snake to the constraints of body limit
    for (int i =0;i<constrain(snakelist.size(),0,bodylimit);i++){
    ellipseMode(CENTER);
    //having the snakes position declared to a vecotr allows for its position to be used to draw the circles
    PVector s = snakelist.get(i);
    noStroke();
    //color is dpeendand on the index chosen form the arrays of snakeColors
    fill(snakeColor);
    //the size is relative to the constant growth of the snake
    size = snakelist.size()/2 + 50;
    ellipse(s.x,s.y,size,size);
    }
  }
  //function determining the direction of movement depending on the key ocde passed
  void direction(int code){
/* the arcade cabinet key codes 
up arr: 38
down arr 40
left arr37
right arr 39

2nd joy movem
r82
f70
d68
g71

w87
s83
a65
d68
*/
//compare codes to the reference above for specific inputs
/*
up arr: 38
down arr 40
left arr37
right arr 39
*/
    //if statements have the code compared to the identity of the snake for their respective switch inputs
    if (identity == 1){
      //the switch statement takes the code and if the value is one of the constants then the following code is executed
    switch(code){
      //for example if the keycode(code) is 38 or the up arrow
  case 38:
  //then only the y direction is equal to -1 meaning it travels up on the screen
   directionY = -1;
   //teh break then resolves the code preventing any other case form executing
     break;
    case 40:
    directionY = 1;
    break;
    case 37:
    directionX= -1;
     break;
     case 39:
   directionX = 1;
     break;
  }
    }
    /* movement keys for player 2
r82
f70
d68
g71
    */
    if (identity == 2){
      switch(code){   
  case 82:
 directionY = -1;
     break;
    case 70:
  directionY = 1;
    break;
    case 68:
   directionX = -1;
     break;
     case 71:
   directionX = 1;
     break;
  }
    }
  }
  //same code format except when the repective key is released stop that directions movement
  void stop(int code) {
    if (identity == 1){
    switch(code){
  case 38:
   directionY = 0;
     break;
    case 40:
    directionY = 0;
    break;
    case 37:
    directionX = 0;
     break;
     case 39:
   directionX = 0;
     break;
  }
    }
    if (identity == 2){
      switch(code){
  case 82:
   directionY = 0;
     break;     
    case 70:
    directionY = 0;
    break;
    case 68:
    directionX = 0;
     break;
     case 71:
   directionX = 0;
     break;
    }
    }
  }
  //function controlling and updati9ngt he position of the snake
  void move(){
    //checks if the position of the snakes edge is colliding with the borders and sets its position to be limited to the borders
    if (position.x >= width -size/2){
      position.x = width -size/2;
    }else if(position.x <= 0 +size/2){
      position.x = 0 +size/2;
    }
    if (position.y >= height -size/2){
      position.y = height -size/2;
    }else if(position.y <= 0 +size/2){
      position.y = 0 +size/2;
    }
    //velocity gets direction added to it to determine its change in position
    //since direction is limited to 1 and negatives, normalizing makes the speed also only 1
    velocity.x = velocity.x +directionX;
    velocity.y = velocity.y +directionY;
  //velocity is the speed that it moves position with the speed either being - or + which determines direction
  //normalizing it allows the speed of diagnol movement to always be 1 balancing movement similar to how a unit circle functions
  //this is useful as diagnol is now constant and ensures the result of the equation is always 1
  velocity.normalize();
  //multiply the velocity to increase with speed so the value is always speed
  velocity.mult(speed);
  //then velocity is added to position updating the values
  position.add(velocity);
  //so it basically does position.x + velocity.x, position.y + velocity.y &position.z + velocity.z except in a single condensed function
  }
//intersection checkers for food and other snakes position
//the boolean function is passed the object of food determined by the for lood in the main draw() loop
  boolean intersecting(Food F){
    //the food object is then dissected for its position and size 
    //the distance takes the center position of each obejct (snake & food) and measures the distance between their centers returning in that value
   float distance = dist(position.x,position.y,F.position.x,F.position.y);
   //then that value is compared to the combined "radius" (food is a square but functions the same) checking if the value is under the limit of both radius
   if (distance < (size + F.size)/2){
     //if the distance betweeen the twos position is less than their combined radius then it must overlap (true)
     return true;
   }else{
     //if it does not the snake does not overlap the food and does not eat it (false)
   return false;
  }
  }

//similar to the food but for the other snakes PVectors
//this one is given size as size is able to change during the program
boolean intersectingSnakeBody(PVector otherS, float otherSize){
  //we restrict this to vectors as snake list is actually PVector List and the for loop passes the Vector information not the entire snake object
  //this is why we also pass its size at the current moment
  
  //comparing distance to the other PVector position
  float distance = dist(position.x, position.y, otherS.x, otherS.y);
  //compare the combined radius to the distance between and return
  //although it is not recieveing the entire object of snaek as a segment the math is similar in the sense it still emulates the position and radius as a circle
  if (distance < (size + otherSize)/2){
   return true; 
  }else{
   return false; 
  }
}
}
