//this is the runner class
class Runners{
  //the variables in the runner class
  float t = 0;
  float tDelta = 0.001;
  float l = 0;
  float lDelta = 0.001;
  float x = 0;
  float y = 0;
  int m = millis();
  
  //remember to change this back to 1000
  int wait = 4000;


  int c = 2;
  boolean a = false;

//the parameters of the runner class
  Runners(float newt, float newl, float newy, float newx, int r, boolean d){
    t = newt;
    l = newl;
    y = newy;
    x = newx;
    c = r;
    a = d;
   }
   
 //commands for running the runners...:P
  void run(){
    move();
    collision();
  }

  
  void move(){
// numbers for the noise horizontally and vertically
   t += tDelta;
   l += lDelta;
  }
  
  void collision(){
    //making and mapping the noise in x and y directions
    float n = noise(t);
    y = map(n,0,1,-20,1.2*height);
    float a = noise(l);
    x = map(a,0,1,-20,1.2*width);
 
 
 //the appearance of the runners
    fill(200,50,30);
    stroke(60,5,10);
    ellipse(x,y,8,8);
    //changing t and l
    t += tDelta;
    l = l+lDelta;
    //keeps the runners on-screen
    if (x>=width || x<=0){
      lDelta = lDelta*-1;
      l = l+lDelta;
    }
    if (y>=height || y<=0){
      tDelta = tDelta*-1;
      t = (-1*t)+tDelta;
    }
    
  }

 
  //my timeout
  boolean cancreate(){
    if (millis()-m > wait){
      return true;
    }
    else{
      return false;
    }
  }
  
 //timeout function 
  void timeout(){
    //m = -1;
    m = millis();
    
  }
  //reset function
  void reset(){
    m = -1;
    m = second();
  }
      

}