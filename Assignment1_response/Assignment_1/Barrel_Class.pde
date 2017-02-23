//This is where I define the class "Barrel."
class Barrel{
  
  float xPos = 0;
  float yPos = 0;
  float xSpeed = 1;
  float ySpeed = 1;
  
  boolean l = false;
  
  Barrel(float tempxPos, float tempyPos) {
    xPos = tempxPos;
    yPos = tempyPos;
  }
  
  void run(){
    display();
    move();
    bounce();
    gravity();
  }
  
  void move(){
    xPos += xSpeed;
    yPos += ySpeed;
  }
  
  void gravity(){
    ySpeed += 0.75;
  }
  
  void bounce(){
    if (xPos>width){
      xSpeed = xSpeed*-1;
    }
    if (xPos<0){
      xSpeed = xSpeed*-1;
    }
    
    if (yPos >= height){
      ySpeed = ySpeed*-1;
      l = false;
      
      if (yPos>=height+50){
        yPos = 0;
        l = false;
      }
    }
    
    if (mousePressed == true){
      if (((xPos-50)<float(mouseX)) && (float(mouseX) < (xPos+50)) && ((yPos-50)<float(mouseY)) && (float(mouseY) <(yPos +50))){
        ySpeed += -2;
        l = true;
      }
    }
  }
// void hit(){
//    print("t");
//  }
  void display(){
    imageMode(CENTER);
    
    image(barrel,xPos,yPos);
  }
  
}