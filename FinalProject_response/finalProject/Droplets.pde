// my Drop class
class Drop{
//variables in the Drop class
  float x;
  float y;
  int w;
  int h;
  float z;
  float v;

//colors for the drops: will be picked from background
  color f;
  color e;
  color c;
  color d;

//parameters of Drop 
  Drop(float newx, float newy, int neww, int newh){
    x = newx;
    y = newy;
    w = neww;
    h = newh;
  }

  void run(){
 //getting the colors   
    c = bk.get(int(x), int(y));
    d = bk.get(int(z), int(v));
    e = bk.get(int(x+2), int(v+7));
    //color added to it to make it look like a reflection: made all values 50 lighter
    f = bk.get(int(z+15), int(y-7))+ color(50,50,50);
    if (x > width/2){
      z = x-4;
    }
    else{
      z = x+4;
    }
    if (y > height/2){
      v = y+4;
    }
    else{
      v = y-4;
    }
  //calls display function in the run  
    display();
  }
  void display(){
  //making of the Droplets
  //the base, including a ring that gives it color
    fill(c);
    stroke(10,30);
    strokeWeight(int(w/5));
    //stroke(2);
    ellipse(x,y,w,h);
  //a slightly smaller circle; color picked from another region to make it appear as if light is being refracted
    noStroke();
    fill(e);
    ellipse(x+(w/10),y+(h/10),floor(w*2/3),floor(h*2/3));
  //an even smaller circle. RGB values were added to the color to make it appear as a reflection on the droplets.
    noStroke();
    fill(f);
    ellipse(x-(w/10),y-(h/10),floor(w/3), floor(h/3));
  }

}