//Barrel Bounce
//Mariah Forbes
//February 13, 2017

PImage barrel;
PImage green;
Barrel[] barrels;
Barrel barrel1;
int turns = 1;
int ball = 0;
boolean h = true;

//int n = 1;
//int i = 1;
//Barrel[] barrels;
//int Barrelmore = i+1;


void setup(){
  size (600, 449);
  barrels = new Barrel[turns];
//  barrel1 = new Barrel(random(50,550), random(50,399));
  for (int i = 0; i < turns; i++){
    barrels[i] = new Barrel(random(50,550), random(50, 399));
  }

  barrel = loadImage("gumball.png");
  green = loadImage("greentexture.jpg");

}
  


  void draw(){

    
   background (green);
   text ("CLICK ALL THE BALLS BEFORE THEY HIT THE GROUND!", 50, 20);
   int t = 0;
   for (int i = 0; i <barrels.length; i++){
     text("Level "+ barrels.length, 500, 20);
           
     
     barrels[i].run();
     //       if (mousePressed == true){
//          if (((barrels[i].xPos-50)<float(mouseX)) && (float(mouseX) < (barrels[i].xPos+50)) && ((barrels[i].yPos-50)<float(mouseY)) && (float(mouseY) <(barrels[i].yPos +50))){
//            barrels[i].l = true;
//          }
//        }
//     int j = barrels.length;
     if (barrels[i].l == true){
       for (int j = barrels.length; j > 0; j--){

         if (barrels[barrels.length-j].l == true){
            t++;
         }
         else {
           t = 0;
      }
     }
     if (t == barrels.length){
          turns += 1;
          setup();
     }
       
   }
 }
}