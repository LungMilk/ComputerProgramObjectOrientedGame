//the timer class
class Timer{
  //saved time marks the system run time it started at
  int savedTime;
  //frequency is the spawn rate of the food
  int frequency;
  //timer recieves the spawn rate and establishes it as frequency 
  Timer(int tempFrequency){
   frequency = tempFrequency;
  }
  //saved time is euqal to the program millisecond the timer is called
  void start(){
    savedTime = millis();
  }
  //boolean function returning if the timer is finished
  boolean isFinished(){
    //passed is a variable which measures the difference of when the timer started to the current time
   int passed = millis() - savedTime;
   //if the time passed is longer then the set limit then the tiemr has finished as it ran for the set time of frequency
   if (passed>frequency){
     //timer has finished
    return true; 
   }
   //tiemr has not
   return false;
  }
  }
