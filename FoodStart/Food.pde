class Food{
  color colorC;
  PVector position;
  Food(){
   position = new PVector(random(width),random(height));
   colorC = color(random(255),random(255),random(255));
  }
  void display(){
    rectMode(CENTER);
    fill(colorC);
   rect(position.x,position.y,10,10); 
  }
}
