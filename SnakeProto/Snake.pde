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
  int bodylimit = 1;
  
  
  PVector position;
  PVector velocity;
  int size;
  float speed = 8;
  float directionX = 0;
  float directionY = 0;
  
  PVector positionSnake;
  int identity;
  
  Snake(int p){
    //positionSnake = new PVector(random(width), random(height));
    velocity = new PVector(0,0);
    position = new PVector(random(width), random(height));
    identity = p;
  }
  
  void display(color snakeColor){
    PVector positionSnakeHistory = new PVector (position.x,position.y);
    
    snakelist.add(positionSnakeHistory);
    
    if (snakelist.size()>bodylimit){
     snakelist.remove(0); 
    }
    
    
    for (int i =0;i<constrain(snakelist.size(),0,bodylimit);i++){
    ellipseMode(CENTER);
    PVector s = snakelist.get(i);
    noStroke();
    fill(snakeColor);
    size = snakelist.size()/2 + 10;
    ellipse(s.x,s.y,size,size);
    }
  }
  void direction(int code){
    //arcade cab keycodes and others
/*
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
    
    if (identity == 1){
    switch(code){
  case 38:
   directionY = -1;
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
  println("my identity is" + identity);
    }
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
    //having the direcition linked to the speed results in once reduced to zero both speed and dirceiton are non funcitonal
  }
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
  void move(){
    //there is no straight down movement
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
    
    //speed is worthless as it is normalized
    velocity.x = velocity.x +speed*directionX;
    velocity.y = velocity.y +speed*directionY;
  //velocity is the speed with the speed either being - or + which determines direction
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

//this is it checking the position to a given object
boolean intersectingSnakeBody(PVector otherS, float otherSize){
  float distance = dist(position.x, position.y, otherS.x, otherS.y);
  if (distance < (size + otherSize)/2){
   return true; 
  }else{
   return false; 
  }
}

//this is the bracket for the snake class V
}
