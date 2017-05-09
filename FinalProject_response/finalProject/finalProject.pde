//this part for making a video; imports the thing that allows the sketch to be saved as a video
//------------------------------------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>
//import com.hamoid.*;
//-------------------------------------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>
//importing the part that allows me to take information from the port.
import processing.serial.*;

//another part for making a video; gets it ready for export
//------------------------------------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//VideoExport videoExport;
//--------------------------------------------------------------->>>>>>>>>>>>>>>>

//defining the port
Serial myPort;
//defining the array of incoming data
String val[];
//the number of values per array
int vcnt = 4;
//a variable to determine if it is horizontal or vertical
int dir;
//vertical value
float valv;
//horizontal value
float valh;

float val1;
float val2;

int posv;
int posh;

//defining an array of the class Drop
Drop[] Drops;
//original drop count
int dropCnt = 0;
//number of droplets possible
int cnt = 13000;
//size of droplets
int d;


//all the colors I use to make the "eraser"
color back;
color lr;
color ur;
color dn;
color up;
color ll;
color ul;
color rt;
color lt;
color cr;
//something else for the video
//---------------------------------------------------------------------->>>>>>>>>>
//PGraphics clear;
//---------------------------------------------------------------------->>>>>>>>>>

//defining the image for the sketch
PImage bk;

//the setup for my sketch
void setup(){
//original values set to approx. the center.
  valh = 20;
  valv = 20;
//finding the port to read from
  String portName = Serial.list()[0];
//making that port a serial to get info from
  myPort = new Serial(this, portName, 9600);
//made it fullScreen
  fullScreen();

//part of the video making
//------------------------------------------------------------->>>>>>
//  videoExport = new VideoExport(this);
//  videoExport.startMovie();
//------------------------------------------------------------->>>>>>

//loading, sizing, and setting the image as a background
  bk = loadImage("backgroundtexture.png");
  bk.resize(width,height);
  background(bk);

  d = width*5/750;
// setting up the drops
  Drops = new Drop[cnt];
// where the drops go;
  for (int i = 0; i < (cnt/2); i++){
    Drops[2*i] = new Drop((d*(i+1))-((width-(d*7/9))*floor(i/(width/d))), (d*2*floor(i/(width/d))+ d), d, d);
    Drops[(2*i)+1] = new Drop((d*i)-((width-(d*7/9))*floor(i/(width/d)))+d/2, ((2*d)*(floor(i/(width/d)))), d, d);
  }
  println(width*5/750);
}


//my draw loop
void draw(){

//makes the drops appear randomly
    for (int l = 0; l<5; l++){
      Drops[int(random(0,cnt))].run();
    }

// starts the val array (which is a string) over again(for each loop)    
    String[] val = new String[vcnt];
//putting data from the port into the array
    for (int m = 0; m<vcnt; m++){
 //if there is data coming in
      if (myPort.available()>0){
 //the array value is the string until a line break
        val[m] = myPort.readStringUntil('\n');
//if there is some data in m...
        if (val[m] != null){
  //...and if that string is v...
          if (val[m].equals("v")){
    //...the direction is set to 0, which is vertical
            dir = 0;
          }
  //...or if the string is h...
          else if (val[m].equals("h")){
    //...the direction is set to 1, which is horizontal
            dir = 1;
          }
  //...or the string is longer than one and the direction is set to 0
          else if (val[m].length() > 1 && dir == 0){
    //...make that string a float and set it as the vertical value
            valv = float(val[m]);
          }
  //...or the string is longer than one and the direction is set to 1
          else if(val[m].length() > 1 && dir == 1){
    //...make that string a float and set it as the horizontal value
            valh = float(val[m]);
          }
        }
//if the value is null, break the loop
          else{
            break;
         }
        }
      }

// setting the floats gotten from the port to values that correspond with the screen:
      val1 = height*(valv)/40;
      val2 = width - (width*(valh)/40);
//making the positions an int, which is a whole number and can be used for placement
      posv = int(val1);
      posh = int(val2);

//if the position is within the screen
     if (posv <= height && posh <= width){
      noStroke();
 //this should take up 1/5 of the height(ideally)
      for (int k = 0; k<(height/5); k++){
    //gets the colors for the various pixels associated with the item position
        back = bk.get(posh, posv);
        lr = bk.get(posh+k, posv + k);
        ur = bk.get(posh+k, posv - k);
        dn = bk.get(posh, posv+k);
        up = bk.get(posh, posv-k);
        ll = bk.get(posh-k, posv+k);
        ul = bk.get(posh-k, posv-k);
        rt = bk.get(posh+k, posv);
        lt = bk.get(posh-k, posv);
// makes the pixels
        fill(back);
        rect(posh, posv, 1, 1);
        fill(lr);
        rect(posh+k, posv+k,1,1);
        fill(ur);
        rect(posh+k, posv-k,1,1);
        fill(dn);
        rect(posh, posv+k,1,1);
        fill(up);
        rect(posh, posv-k,1,1);
        fill(ll);
        rect(posh-k, posv+k,1,1);
        fill(ul);
        rect(posh-k, posv-k,1,1);
        fill(rt);
        rect(posh+k, posv,1,1);
        fill(lt);
        rect(posh-k, posv,1,1);
      }
     }
 //another part to make a video
 //---------------------------------------------->>>>>>>>>>>>>>>>>>>
 //    videoExport.saveFrame();
 //--------------------------------------------->>>>>>>>>>>>>>>>>>

}