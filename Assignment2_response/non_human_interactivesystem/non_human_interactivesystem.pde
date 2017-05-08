//Mariah Forbes
//Project 2: Non-Human Interactive System
//March 27th, 2017
//just a video capture thing; can be removed later
//------------------------------------------------>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
import com.hamoid.*;
VideoExport videoExport;
//----------------------------------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>

ArrayList<Runners> runners = new ArrayList<Runners>();
//Runners[] runners;
Chasers[] chasers;
//start off with 2 runners
int runnerCnt = 2;
//start off with 0 chasers
int chaserCnt = 0;
int tempCnt = 0;
//the total number of any of them
int cnt = 300;

float[] check = new float[runnerCnt];

//initiating beginning runners
Runners runner1;
Runners runner2;
Runners runner3;
Chasers chaser1;
Chasers chaser2;


void setup() {
  //size of sketch
  size(1200, 700);
  background(55, 0, 15);
  //  chaser1 = new Chasers(random(0,width), random(0,height), 2, false);
  //  chaser2 = new Chasers(random(0,width), random(0,height), 2, false);
  //slows down the sketch to allow things to calculate easier
  frameRate(30);
  //Defining chasers
  chasers = new Chasers[cnt];
  
  //more of the video export. Can be deleted later.
  //-------------------------------------------------------------------->>>>>>>>>>>>
    videoExport = new VideoExport(this);
  videoExport.startMovie();
 //---------------------------------------------------------------------->>>>>>>>>>
 
 
  //setting up chasers
  for (int m = 0; m < chaserCnt; m++) {
    chasers[m] = new Chasers(random(0, width), random(0, height), random(0, width), random(0,height), 2, false);
  }
  //setting up runners
  for ( int i = 0; i < runnerCnt; i++ ) {
    runners.add(new Runners(random(0, width), random(0, height), random(0, width), random(0, height), 2, false));
  }

}

//draw loop: repeats every frame
void draw() {

  //random dots that cover the screen and make it look like "trails"
  for (int i=0; i<250; i++) {
    float x = random(width);
    float y = random(height);
    fill(55, 0, 15);
    stroke(50, 0, 10);
    strokeWeight(1);
    ellipse(x, y, 4, 4);
  }

//running the runners based on their class
  for ( int j=0; j<runnerCnt; j++ ) {
    Runners run = runners.get(j);
    run.run();
  }


//when there are more than six times the runners to chasers, add a chaser.
  if (runnerCnt > (chaserCnt+1)*6) {
    chasers[chaserCnt] = new Chasers(random(0, width), random(0, height), random(0, width), random(0, height), 2, false);
    chaserCnt++;
  }

  
  //running the chasers
  for (int n=0; n<chaserCnt; n++) {

    chasers[n].run();
  }

// setting temp to the runner count
  tempCnt = runnerCnt;
  //println(tempCnt);
          //println(runners.size());

  //checking every runner...
  for (int k = 0; k < runnerCnt; k++) {


    runner1 = runners.get(k);

//...against every other runner
    for (int r = k+1; r<runnerCnt; r++) {
      runner2 = runners.get(r);

//if the runners are within a certain range
      if (abs(runner1.y - runner2.y)<20 && abs(runner1.x - runner2.x)<20 && runner1.cancreate() && runner2.cancreate() ) {
        //add a runner
        if (tempCnt < runners.size() + 1) {

          tempCnt++;
          runners.add( new Runners(random(0, height), random(0, width), runner1.x, runner2.y, 2, false) );



          //set a timeout function so that the two joining "runners" can't make another "baby"
          runner1.timeout();
          runner2.timeout();
//recalibrate runner and temp counts
          runnerCnt = tempCnt;
        }     
      }
 //checks all those runners from above against all the chasers:
     for (int o = 0; o < chaserCnt; o++) {
        chaser1 = chasers[o];
        println("chase: " + o + " num: " + chasers.length);
        
        //me trying to make the chasers chase. Didn't go well:
        //-------------------------------------------------------------------->>>>>
        //for (int q = 0; q < runnerCnt; q++){
        //    check[q] = dist(runners.get(q).x, runners.get(q).y, chaser1.x, chaser1.y);
        //  for (int s = 0; s < runnerCnt-1; s++){
        //    if (check[s] == min(check)){
        //      runner3 = runners.get(s);
        //    }
        //  }
        //}

        //if (dist(runner3.x, runner3.y, chaser1.x, chaser1.y)<100){
        //    chaser1.chase();
      //}
////    //    if (dist(runner1.x, runner1.y, chaser1.x, chaser1.y)<100){
        //  chaser1.chase();
        //  if(runner1.x > chaser1.x){
        //    chaser1.x += 2;
        //  }
        //  else if (runner1.x < chaser1.x){
        //    chaser1.x += -2;
        //  }
        //  if (runner1.y > chaser1.y){
        //    chaser1.y += -2;
        //  }
        //  else if (runner1.y < chaser1.y){
        //    chaser1.y += 2;
        //  }
     //------------------------------------------------------------------>>>>>

//remove a runner if a chaser runs into it
          if (dist(runner1.x, runner1.y, chaser1.x, chaser1.y)<20 && k > 1) {
            runners.remove(k);
            runnerCnt--;
            tempCnt = runnerCnt;
          }
//        }
      }
    }
  }
  
  //more video export stuff. can be removed later.
  //------------------------------------------------------------------>>>>>>>>>>>>>>
  
  videoExport.saveFrame();
  //------------------------------------------------------------------>>>>>>>>>>>>>>
}  