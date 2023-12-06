class endScreen{
 //i want the position of the balls to be somewhat randon
  
  BouncingBall[] BBalls = new BouncingBall[100];
  
  
  endScreen(){
    for (int i = 0;i<BBalls.length;i++){
    BBalls[i] = new BouncingBall(int(random(50)));
    }
  }
  
  void display(){
    
    background(0);
    fill(255);
    textSize(50);
    text("game over",90,200);
    
    
    for (int i = 0; i<BBalls.length;i++){
    BBalls[i].gravity();
    BBalls[i].move();
    BBalls[i].display();
    }
  }
  
}
