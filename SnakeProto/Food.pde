//an object class that handles the foods properites
class Food {
  //basic variables
  color colorC;
  int size;
  //position is a pvector to have t eh values contained in a single vector 
  PVector position;
  
  Food() {
    //food is removed and intitialized constantly so an restart is reduntant as the object is simply deleted
    position = new PVector(random(width), random(height));
    colorC = color(random(255), random(255), random(255),100);
    size =10;
  }
  void display() {
    //displays the rectangles that represent the food with a random color
    rectMode(CENTER);
    noStroke();
    fill(colorC);
    rect(position.x, position.y, size, size);
  }
}
