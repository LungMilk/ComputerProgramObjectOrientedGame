ArrayList<Food> foodList = new ArrayList<Food>();
void setup(){
 size(400,400); 
}
void draw(){
  for (int i =0; i< foodList.size();i++){
  Food f = foodList.get(i);
  f.display();
  }
}
void keyPressed(){
  foodList.add(new Food());
}
