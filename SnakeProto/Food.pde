class Food {
  
  color colorC;
  int size;
  PVector position;
  
  Food() {
    position = new PVector(random(width), random(height));
    colorC = color(random(255), random(255), random(255));
    size =10;
  }
  void display() {
    
    rectMode(CENTER);
    noStroke();
    fill(colorC);
    rect(position.x, position.y, size, size);
  }
}
