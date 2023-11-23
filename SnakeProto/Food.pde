class Food {
   //refer to planning sheet for questions
  //25. A class is the logical information that can be referenced as an object where as an object is the physical entity of a class.
  //26. a constructor function creates the entity of a class. It sets the properties of the new object when the class is initialized
  //27. having their own tab allows for easier modifications and isolations for debugging to create an easy method of understanding and identification of classes.
  //28. Write a class with a constructor function
  //29. Use the keyword new to instantiate an object
  //30. Write a constructor function with parameters */
  color colorC;
  int numb;
  int size;
  PVector position;
  //rework its value to be randomized within the global variables 
  Food(int num) {
    position = new PVector(random(width), random(height));
    colorC = color(random(255), random(255), random(255));
    numb=num;
    size =10;
  }
  void display() {
    rectMode(CENTER);
    noStroke();
    fill(colorC);
    rect(position.x, position.y, size, size);
    //println(numb);
  }
}
