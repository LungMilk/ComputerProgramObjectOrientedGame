class BouncingBall{
 //the balls will be used in the end screen to include the missing physics skills
 
 //the ball has to move,display and be effected by gravity
 
 PVector position;
 //we can set speed to the 3rd value as it will remain constant in the vector itself
 //width isnt allowed
 float wide;
 float gravity = 0.1;
 
 BouncingBall(int tempw){
   position = PVector.random2D();
   position.mult(random(400));
   
   position.z = 0;
   
   wide = tempw;
 }
 
 void gravity(){
    position.z = position.z +gravity;
  }
  
  void display(int winIdentity){
    color snakeColor = 0;
    if (winIdentity==1){
      snakeColor = SnakeColors[colorIndex];
    }
    if (winIdentity==2){
      snakeColor = SnakeColor2[colorIndex2];
    }
    
    fill(snakeColor,100);
    noStroke();
    ellipse(position.x, position.y,wide,wide);
  }
  void move(){
    position.y = position.y+position.z;
    
    //add bounce
    if(position.y>height){
     position.z = position.z*-0.9;
     position.y = height;
    }
  }
  
}
