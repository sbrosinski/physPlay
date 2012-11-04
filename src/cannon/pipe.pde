
class Pipe {

  PVector location;
  float pipeWidth = 40, pipeHeight = 20; 
  float minAngle = 10, maxAngle = 60;
  float angle = 0;
  
  Pipe() {
    location = new PVector(10 + pipeWidth / 2, height - 10 - pipeHeight / 2);
  } 
  
  void display() {
    stroke(0);
    fill(175);
    
    pushMatrix();
    rectMode(CENTER);
    translate(location.x, location.y);
    rotate(radians(-1 * angle));
    rect(0, 0, pipeWidth, pipeHeight);
    popMatrix();
    
    rect(location.x, location.y + pipeHeight, 10, 40);
  } 
  
  void update() {
    angle = map(mouseY, 0, height, maxAngle, minAngle);  
  }
  
}
