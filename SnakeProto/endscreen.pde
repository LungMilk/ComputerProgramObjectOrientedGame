//the class of end screen allows it to manage its own properties
class endScreen{  
  //the array of bouncing balls is intitialized once end screen is called
  BouncingBall[] BBalls = new BouncingBall[100];
//constructor function
  endScreen(){
    //teh for loop goes throught the length of the array creating a new BouncingBall object at each position in the array
    for (int i = 0;i<BBalls.length;i++){
      //passing the ball its random width
    BBalls[i] = new BouncingBall(random(50));
    }
  }
  //the final endscreen display
  void display(int winIdentity){
    //win identity tells which player won the game and the players lengths
    background(0);
    //fopr loop that draws,updates and moves the balls so they bounce
      for (int i = 0; i<BBalls.length;i++){
    BBalls[i].gravity();
    BBalls[i].move();
    //passing it win identity selects which color it appears as
    BBalls[i].display(winIdentity);
    }
    //big congrats text 
    fill(255);
    textSize(100);
    //having winIdentity as a variable allows for some string manipulation where the text displayed is reliant on the value instead of having some extra lines
    text("Player " + winIdentity + " Wins!", width/2 -300,height/2 - 200);
    //creates text displaying the players score
    textSize(50);
    text("Player 1 Length: " + snake.bodylimit,width/2 - 200,height/2);
    text("Player 2 Length: " + snake2.bodylimit,width/2 - 200,height/2 +50);
    //if they are at the endscreen and they press either the start or restart button the program resets
    if(key=='2' || key =='1'){
     restart(); 
    }
  }
}
