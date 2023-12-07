class startScreen{
  
  
  startScreen(){
    colorIndex = 0;
    
  }
  void display(){
    background(0);
    
    fill(255);
    textSize(40);
    text("Untitled Snake Game",25,100);
    
    fill(SnakeColors[colorIndex]);
    ellipse(width/2 - 70,height/2 - 70,50,50);
    
    fill(SnakeColor2[colorIndex2]);
    ellipse(width/2+ 70,height/2 + 70,50,50);
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
