class Snake{
  //i want each snake to handle its own expantion and growth as well as intersections
  //snake body is what shouldbe repeated
  // to get the snake to move there will be a directional input that then causes the snake to move in a direction
  
  /*
  how to get the body segments to be more spaced out
  
  what if i 
  have the position segment as normalized in the update but then mulitply velocity after to show a speed change
  so the position is recorded if normalized then the speed of the starting position is faster
  */
  ArrayList<PVector> snakelist = new ArrayList<PVector>();
  
  PVector position;
  PVector velocity;
  int size;
  float speed = 8;
  PVector positionSnake;
  color snakeColor;
  int identity;
  
  Snake(int p){
    //positionSnake = new PVector(random(width), random(height));
    velocity = new PVector(0,0);
    position = new PVector(random(width), random(height));
    identity = p;
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
    noStroke();
    fill(SnakeColors[colorIndex]);
    size = snakelist.size()/2 + 10;
    ellipse(s.x,s.y,size,size);
    }
  }
  void move(){
    //there is no straight down movement
  if(keyPressed){
    if(goUp){
     velocity.y= -speed;
    }
    else if(goDown){
     velocity.y= speed;
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
  //velocity.mult();
  position.add(velocity);
  //what if the object added to the history list is the position as well as an additional
  }
  
  boolean intersecting(Food F){
   float distance = dist(position.x,position.y,F.position.x,F.position.y);
   if (distance < (size + F.size)/2){
     return true;
   }else{
   return false;
  }
  }
}
