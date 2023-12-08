class endScreen{
 //i want the position of the balls to be somewhat randon
  
  BouncingBall[] BBalls = new BouncingBall[100];


  endScreen(){
    for (int i = 0;i<BBalls.length;i++){
    BBalls[i] = new BouncingBall(int(random(50)));
    }
  }
  
  void display(int winIdentity){
    background(0);
      for (int i = 0; i<BBalls.length;i++){
    BBalls[i].gravity();
    BBalls[i].move();
    BBalls[i].display(winIdentity);
    }
    
    fill(255);
    textSize(40);
    text("player " + winIdentity + " wins!",90,170);
    
    textSize(20);
    text("player 1 Length: " + snake.bodylimit,70,250);
    text("player 2 Length: " + snake2.bodylimit,110,250);
   
  }
  
}
