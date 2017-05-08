//this is the chaser class
class Chasers{
  //variables in the chaser class
  float t = 0;
  float tDelta = 0.0007;
  float l = 0;
  float lDelta = 0.0007;
  float x = 0;
  float y = 0;
  int m = -1;
  float a = 0;
  float n = 0;
  

  int c = 2;
  boolean g = false;
  
  //parameters for the chaser class:
  Chasers(float newt, float newl, float newx, float newy, int r, boolean d){
    x = newx;
    y = newy;
    t = newt;
    l = newl;
    c = r;
    g = d;
   }
   //running the chaser class
  void run(){
    move();
    collision();
  }
  
  void move(){
//changes in t and l, just like the runner class
   t += tDelta;
   l += lDelta;
  }

  //really, more movement definitions
  void collision(){     
      n = noise(t);      
      a = noise(l);

    y = map(n,0,1,-20, height);
    x = map(a,0,1,-20, width);
    
    //appearance of chasers
    fill(200,150,30);
    stroke(60,40,5);
    rect(x,y,10,10);
    
    //more adding t and l
    t += tDelta;
    l = l+lDelta;
    
//make sure the chasers don't go out of bounds
    if (x>=width || x<=0){
        lDelta = lDelta*-1;
        l = l+lDelta;
    }
    if (y>=height || y<=0){
        tDelta = tDelta*-1;
        t = (-1*t)+tDelta;
    }

  }
// another attempt at chasing: didn't work.
//-------------------------------------------------------------------------->>>>>>>>>
  void chase(){
        //if(runner3.x > x){
        //  lDelta = 1;
        //  a = l;
        //}
        //else if (runner3.x < x){
        //  lDelta = -1;
        //  a = -l;
        //}
        //if (runner3.y > y){
        //  tDelta = -1;
        //  n = -t;
        //}
        //else if (runner3.y < y){
        //  tDelta = 1;
        //  n = t;
        //}
  }
//---------------------------------------------------------------------------->>>>>>>>

}