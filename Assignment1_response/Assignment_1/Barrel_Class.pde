//This is where I define the class "Barrel."
class Barrel{
//Here I define the variables used in this class.  
  float xPos = 0;
  float yPos = 0;
  float xSpeed = 1;
  float ySpeed = 1;
  
  boolean l = false;
  
//This is the part of the class you see in the rest of my coding that allows me to affect the class from there.
  
  Barrel(float tempxPos, float tempyPos) {
    xPos = tempxPos;
    yPos = tempyPos;
  }
//Here I define what the run() function does.
  void run(){
    display();
    move();
    bounce();
    gravity();
  }
//This is part of the run() function. It defines what the move() funciton does. Here the speed changes the x and y positions of my object.
  void move(){
    xPos += xSpeed;
    yPos += ySpeed;
  }
//This is the gravity() function and is part of the run() function. It puts an element of gravity on my ball, which slows down the ball by 0.75. Here, positive is down on the y-axis, which is why the pull downwards keeps it from bouncing too much.
  void gravity(){
    ySpeed += 0.75;
  }
//This is the bounce() function, which allows my objects to react to the borders of the window.  
  void bounce(){
    if (xPos>width){
      xSpeed = xSpeed*-1;
    }
    if (xPos<0){
      xSpeed = xSpeed*-1;
    }
 //This part makes sure the objects know to reset to "false" when they hit the bottom.
 
    if (yPos >= height){
      ySpeed = ySpeed*-1;
      l = false;
      
      if (yPos>=height+50){
        yPos = 0;
        l = false;
      }
    }
  //This calls l as true if the mouse is clicked on the visible object.
    if (mousePressed == true){
      if (((xPos-50)<float(mouseX)) && (float(mouseX) < (xPos+50)) && ((yPos-50)<float(mouseY)) && (float(mouseY) <(yPos +50))){
        ySpeed += -2;
        l = true;
      }
    }
  }
//Displays the balls, centering the image on the object, and allows with this part of the code to interact with the rest of the body.
//It is also a part of run().
  void display(){
    imageMode(CENTER);
    
    image(barrel,xPos,yPos);
  }
  
}
