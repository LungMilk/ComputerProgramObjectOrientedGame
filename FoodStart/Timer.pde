class Timer{
  int savedTime;
  int frequency;
  Timer(int tempFrequency){
   frequency = tempFrequency;
  }
  void start(){
    savedTime = millis();
  }
  boolean isFinished(){
   int passed = millis() - savedTime;
   if (passed>frequency){
    return true; 
   }
   return false;
  }
  }
  
  
