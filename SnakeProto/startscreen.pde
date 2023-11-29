class startScreen{
  int colorIndex;
  
  
  startScreen(){
    int colorIndex = 0;
    
  }
  void display(){
    background(0);
    fill(SnakeColors[colorIndex]);
    ellipse(width/2,height/2,50,50);
  }
  void colorUpdate(){
    //(mouseX <= (width/2+25) && mouseX >= (width/2-25)) && 
    if (colorChange ==true){
      colorIndex++;
      if (colorIndex>=8){
       colorIndex=0; 
      }
      colorChange=false;
    }
  }
  
}
