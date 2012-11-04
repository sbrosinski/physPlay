
class Pipe {

  PVector location;
  float pipeWidth = 40, pipeHeight = 20; 
  float minAngle = 0, maxAngle = 60;
  float angle = 0;
  
  Pipe() {
    location = new PVector(10, height - 10- pipeHeight);
  } 
  
  void display() {
    stroke(0);
    fill(175);
    
    pushMatrix();
    rectMode(CENTER);
    translate(location.x, location.y);
    rotate(radians(-1 * angle));
    rect(20, 0, pipeWidth, pipeHeight);
    popMatrix();
  } 
  
  void update() {
    angle = map(mouseY, 0, height, maxAngle, minAngle);  
  }
  
}
