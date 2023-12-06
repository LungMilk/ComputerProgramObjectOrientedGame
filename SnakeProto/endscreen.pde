class endScreen{
 
  endScreen(){
    
  }
  void display(){
    BBall.gravity();
    BBall.move();
    BBall.display();
    
    background(0);
    fill(255);
    textSize(50);
    text("game over",90,200);
  }
  
}
