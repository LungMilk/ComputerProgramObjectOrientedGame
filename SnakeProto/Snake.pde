class Snake{
  //i want each snake to handle its own expantion and growth as well as intersections
  //snake body is what shouldbe repeated
  // to get the snake to move there will be a directional input that then causes the snake to move in a direction
  int xdirection;
  int ydirection;
  
  PVector positionSnake;
  PVector velocity;
  //move all contructor ot a seperate funciton called restart to allow for replayability
  Snake(){
    positionSnake = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
  }
  
  void display(){
    PVector positionSnakeHistory = new PVector (positionSnake.x,positionSnake.y);
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
    velocity.normalize();
    positionSnake.x = positionSnake.x + velocity.x;
    positionSnake.y = positionSnake.y + velocity.y;
  }
  //check boundries
  //movement is restrictive
  void direction(char c){
    //y + down y - up
    //x + right x - left
    
    //to resolve movement i have to have the movement keys operate in such a way that is if s||d per direction and do some wacky math
    
    //have direction be the 1,-1 
    if (c=='w'){
      velocity.y= -1;
    }
    if (c=='s'){
      velocity.y = 1;
    }
    if (c=='a'){
      velocity.x = -1;
    }
    if (c=='d'){
      velocity.x = 1;
    }
  }
  void stop(char c){
   if (c=='w' || c=='s'){
    velocity.y = 0; 
   }
   if (c=='a' || c=='d'){
    velocity.x = 0; 
   }
  }
}
