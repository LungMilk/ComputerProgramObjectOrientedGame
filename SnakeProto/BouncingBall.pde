//balls used in the end screen for cool fun graphics
class BouncingBall{

 //having position depeding on a PVector allows for ease of control of the variables
 PVector position;
 //we can set speed to the 3rd value as it will remain constant in the vector itself
 
 //width isnt allowed
 float wide;
 float gravity = 0.1;
 //the width of the balls have a random size determined on the end screen
 BouncingBall(float tempw){
   //the position of the PVector is randomized to have variety of its height and position
   position = PVector.random2D();
   //due to it being a PVector it is able to utilize system functions that can modify their porperites or values for complex maths
   //mult allows the random2d vector variables to span the entire screen
   position.mult(random(1500));
   //establishes the starting speed
   position.z = 0;
   //width variable is equal to the value passed on endscreen
   wide = tempw;
 }
 //math function that updates the speed and has the object fall due to gravity
 void gravity(){
    position.z = position.z +gravity;
  }
  //display is depending on the winner for their color
  void display(int winIdentity){
    //establish the color identity as well if a bug occurs of no identity given the color is black
    color snakeColor = 0;
    //conditional that determines the winers identity by referencing their position in theri respective color arrays
    if (winIdentity==1){
      snakeColor = SnakeColors[colorIndex];
    }
    if (winIdentity==2){
      snakeColor = SnakeColor2[colorIndex2];
    }
    // each ball gets an ellipse with its size and position  randomized
    fill(snakeColor,100);
    noStroke();
    ellipse(position.x, position.y,wide,wide);
  }
  //updating the positon
  void move(){
    //z is the speed that y falls at with y being updated by the value
    position.y = position.y+position.z;
    
    //once the position hits the bottom reverse the speed it travels and declerate it reducing the overall momentum in the ball
    //having its width included in the conditional make its hit on the edge of the ball instead of its center
    if(position.y +wide/2>height){
     position.z = position.z*-0.9;
     position.y = height - wide/2;
    }
  }
  
}
