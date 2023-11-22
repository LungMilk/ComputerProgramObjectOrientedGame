ArrayList<Food> foodList = new ArrayList<Food>();
Timer timer;
int frequency = 2000;

void setup(){
 size(400,400);
 timer = new Timer(frequency);
 timer.start();
 
}
void draw(){
  if (timer.isFinished()==true){
   foodList.add(new Food(foodList.size())); 
   timer.start();
  }
  for (int i =0; i< foodList.size();i++){
  Food f = foodList.get(i);
  f.display();
  }
}
void keyPressed(){
  foodList.add(new Food(foodList.size()));
}
