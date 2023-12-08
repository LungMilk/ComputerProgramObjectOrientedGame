class startScreen{
  
  
  startScreen(){
    colorIndex = 0;
    colorIndex2 =1;
  }
  void display(){
    background(0);
    
    fill(255);
    textSize(40);
    text("Untitled Snake Game",25,100);
    
    fill(SnakeColors[colorIndex]);
    ellipse(width/2 - 70,height/2,50,50);
    
    fill(SnakeColor2[colorIndex2]);
    ellipse(width/2+ 70,height/2,50,50);
  }
  void colorUpdate(){
 
    //(mouseX <= (width/2+25) && mouseX >= (width/2-25)) && 
    //issue regarding that if player 1 is at zero it will returnit to the position 
    //3 for player 1 4 for player 2 will cycle through the color index of each colors
    if (keyPressed){
      if (key == '3'){
      colorIndex++;
      if(colorIndex ==colorIndex2){
       colorIndex++; 
      }
      if(colorIndex >= SnakeColors.length){
      colorIndex =0;
    }
      }
      if (key == '4'){
      colorIndex2++;
      if(colorIndex ==colorIndex2){
       colorIndex2++; 
      }
      if (colorIndex2>=SnakeColor2.length){
       colorIndex2=0; 
      }
      }
    }

  }
  
}
