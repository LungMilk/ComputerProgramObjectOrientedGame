class endScreen{  
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
    text("player 1 Length: " + snake.bodylimit,80,230);
    text("player 2 Length: " + snake2.bodylimit,80,250);
    
    if(key=='r'){
     restart(); 
    }
   
  }
  
}
