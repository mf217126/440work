//Barrel Bounce
//Mariah Forbes
//February 13, 2017
//Updated: February 22, 2017


//Here I import my images and define my variables that are used throughout the rest of the code.

PImage barrel;
PImage green;
Barrel[] barrels;
Barrel barrel1;
int turns = 1;
int ball = 0;
boolean h = true;


//This is the setup for the game. It also will change depending on the level.
void setup(){
  size (600, 449);
//The number of Barrel objects created in the array is dependent on the number of turns, which begins with one (thus one ball).
  barrels = new Barrel[turns];
//Creating the objects int he array.
  for (int i = 0; i < turns; i++){
    barrels[i] = new Barrel(random(50,550), random(50, 399));
  }
//Defining the images and where they are loaded from.

  barrel = loadImage("gumball.png");
  green = loadImage("greentexture.jpg");

}
  

//The draw loop: good for one level.
  void draw(){

//I call my background each time, because I don't want to see the paths the objects make all over the place.
   background (green);
//Instructions and where they are placed.
   text ("CLICK ALL THE BALLS BEFORE THEY HIT THE GROUND!", 50, 20);
//Here "t" is a check for the total number of objects.
   int t = 0;
//A for loop to make sure all of the objects in the array are run.
   for (int i = 0; i <barrels.length; i++){
     text("Level "+ barrels.length, 500, 20);
           
     
     barrels[i].run();
//This checks to make sure all of the balls have been clicked before the hit the ground.
     if (barrels[i].l == true){
       for (int j = barrels.length; j > 0; j--){

         if (barrels[barrels.length-j].l == true){
            t++;
         }
         else {
           t = 0;
      }
     }
//If all of the objects in the array have that part of them true, then setup is run and the program starts over with wone more "barrel" in the array.
     if (t == barrels.length){
          turns += 1;
          setup();
     }
       
   }
 }
}
