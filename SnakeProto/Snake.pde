class Snake{
  //i want each snake to handle its own expantion and growth as well as intersections
  //snake body is what shouldbe repeated
  // to get the snake to move there will be a directional input that then causes the snake to move in a direction
  PVector position;
  PVector velocity;
  
  float speed = 1;
  
  int xdirection;
  int ydirection;
  
  
  
  PVector positionSnake;
  
  Snake(){
    positionSnake = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
    position = new PVector(200,200);
  }
  
  void display(){
    PVector positionSnakeHistory = new PVector (position.x,position.y);
    snakelist.add(positionSnakeHistory); 
    if (snakelist.size()>bodylimit){
     snakelist.remove(0); 
    }
    
    for (int i =0;i<constrain(snakelist.size(),0,bodylimit);i++){
    ellipseMode(CENTER);
    PVector s = snakelist.get(i);
    ellipse(s.x,s.y,10,10);
    }
  }
  void grow(){
    PVector positionSnakeHistory = new PVector (positionSnake.x,positionSnake.y);
    snakelist.add(positionSnakeHistory); 
  }
  void move(){
  if(keyPressed){
    if(goUp){
     velocity.y=-speed;
    }
    else if(goDown){
     velocity.y=speed;
    }
    //else{
    // velocity.y=0; 
    //}
    
    if(goLeft){
     velocity.x= -speed;
    }
    else if(goRight){
     velocity.x= speed;
    }
    //else{
    // velocity.x=0; 
    //}
  }
  velocity.normalize();
  position.add(velocity);
  }
}
