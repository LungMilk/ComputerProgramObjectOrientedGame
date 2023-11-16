//Main game body program
//
//show each of the functions start, end, snake,food,
GameOver gameOver = new GameOver();
//GamePlay gameplay = new GamePlay();
boolean isGameOver;
void setup(){
  size(400,400);
  restart();
}

void draw(){
 background(255);
 if(isGameOver){
   gameIsOver();
 }
 else{
  gamePlay(); 
 }
}
void gamePlay(){
  background(255);
  println("the game is playing");
}
void keyPressed(){
  if(isGameOver){
   restart(); 
  }else{
    isGameOver=true; 
  }
}
void gameIsOver(){
  background(0);
 println("game Over"); 
}
void restart(){
  isGameOver = false;
 println("everything is reset"); 
}
