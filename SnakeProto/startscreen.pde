//object handling the start screen shenanigans
class startScreen{
  //sizEllipse is used forhte ellipse for eahc playes color choice
  //size is for the repeating pattern in the background
  int size = (width/10);
  int sizeEllipse = 100;
  
  startScreen(){
    //once the screen is made the color indexs are set to the first position with the player 2 set one after
    colorIndex = 0;
    colorIndex2 =1;
  }
  //the screens display
  void display(){
    //background is drawn as a nive purple for the black circle overlay
    background(80,0,80);
    //a nested loop that displays circles across the screen
    for (int y =0 + size/2; y<height; y+=size ){
      //the y value increases at a rate of size till the limit of the screen
    for(int x =0 + size/2; x<width; x+=size ){
      //the x value is then increased in the nested loop
      //however it is drawn in a row like manner with the x increasing till the widths then in proceeds to draw the next next row
      // OOOOOOOOOOOOOOO | - x drawn till completion
      // OOO             V - then moves the position of y down to draw the next row
      //if x and y were swaped in the nested loop it woul draw in a colum like fashion but the result would look identical
      noStroke();
      fill(0);
      //having size a number divisible by the cnavas size has the drawings fit neatly on the screen
      ellipse(x,y,size,size);
    }
    }
    //title of the game
    fill(255);
    textSize(40);
    text("Untitled Snake Game",25,100);
    
    //identifying text of each players color choice
    textSize(20);
    text("Player 1",width/2 - 135,height/2 - 20);
    textSize(20);
    text("Player 2",width/2 + 65,height/2 - 20);
    //information text on how to start he game
    textSize(30);
    text("Press 1 to start",width/2 - 90,height/2 + 150);
    //the ellipse to showcase the players starting colors depend on the values in SnakeColor
    fill(SnakeColors[colorIndex]);
    ellipse(width/2 - sizeEllipse,height/2 + sizeEllipse/2,sizeEllipse,sizeEllipse);
    
    fill(SnakeColor2[colorIndex2]);
    ellipse(width/2+ sizeEllipse,height/2 + sizeEllipse/2,sizeEllipse,sizeEllipse);
  }
  void colorUpdate(){
 
    //on the arcade cabinet the joysticks each have a small button to that in this program allows them to cycle through the list
    //3 for player 1 4 for player 2 will cycle through the color index of each colors
    //once a key is pressed it checks which key it was with it determineing if the color index is changed
    if (keyPressed){
      //the additional buttons are used to utilize the extra buttons on the cabinet
      if (key == '3' || key =='c'){
      colorIndex++;
      if(colorIndex ==colorIndex2){
       colorIndex++; 
      }
      if(colorIndex >= SnakeColors.length){
      colorIndex =0;
    }
      }
      //controls the ability to go backwards thought the index
      if (key == '5'){
      colorIndex--;
      if(colorIndex ==colorIndex2){
       colorIndex--; 
      }
      if (colorIndex<=0){
       colorIndex=SnakeColors.length; 
      }
      }
      //buttons to control player 2s controls
      if (key == '4' || key ==']'){
      colorIndex2++;
      if(colorIndex ==colorIndex2){
       colorIndex2++; 
      }
      if (colorIndex2>=SnakeColor2.length){
       colorIndex2=0; 
      }
      }
      if (key == '6'){
      colorIndex2--;
      if(colorIndex ==colorIndex2){
       colorIndex2--; 
      }
      if (colorIndex2<=0){
       colorIndex2=SnakeColor2.length; 
      }
      }
    }
  }
}
