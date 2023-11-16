class Snake{
  //i want each snake to handle its own expantion and growth as well as intersections
  //snake body is what shouldbe repeated
  // to get the snake to move there will be a directional input that then causes the snake to move in a direction
  int xPos;
  int yPos;
  int xdirection;
  int ydirection;
  
  Snake(){
    xPos = width/2;
    yPos = height/2;
  }
  
  void display(){
    ellipseMode(CENTER);
    ellipse(xPos,yPos,10,10);
  }
  void move(){
    xPos = xPos + 1* xdirection;
    yPos = yPos + 1* ydirection;
  }
  //check boundries
  //movement is restrictive
  void direction(char c){
    //y + down y - up
    //x + right x - left
    
    //to resolve movement i have to have the movement keys operate in such a way that is if s||d per direction and do some wacky math
    
    //have direction be the 1,-1 
    if (c=='w'){
      ydirection = -1;
    }
    if (c=='s'){
      ydirection = 1;
    }
    if (c=='a'){
      xdirection = -1;
    }
    if (c=='d'){
      xdirection = 1;
    }
  }
  void stop(char c){
   if (c=='w' || c=='s'){
    ydirection = 0; 
   }
   if (c=='a' || c=='d'){
    xdirection = 0; 
   }
  }
}
