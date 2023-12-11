class startScreen{
  
  int sizeEllipse = 100;
  startScreen(){
    colorIndex = 0;
    colorIndex2 =1;
  }
  
  void display(){
    background(0);
    
    for(int i =0 + 5;i<height;i+=5){
      //noStroke();
      ellipse(i,100,10,10);
    }
    
    fill(255);
    textSize(40);
    text("Untitled Snake Game",25,100);
    
    
    textSize(20);
    text("Player 1",width/2 - 135,height/2 - 20);
    textSize(20);
    text("Player 2",width/2 + 65,height/2 - 20);
    textSize(30);
    text("Press 1 to start",width/2 - 90,height/2 + 150);
    
    fill(SnakeColors[colorIndex]);
    ellipse(width/2 - sizeEllipse,height/2 + sizeEllipse/2,sizeEllipse,sizeEllipse);
    
    fill(SnakeColor2[colorIndex2]);
    ellipse(width/2+ sizeEllipse,height/2 + sizeEllipse/2,sizeEllipse,sizeEllipse);
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
