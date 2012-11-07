
class Pipe {

  PVector location;
  float pipeWidth = 40, pipeHeight = 20; 
  float minAngle = 10, maxAngle = 60;
  float angle = 0;
  float maxPower = 50, minPower = 1, power = minPower;
  ArrayList<Ball> balls = new ArrayList<Ball>();
  
  Pipe() {
    location = new PVector(10 + pipeWidth / 2, height - 10 - pipeHeight / 2);
  } 
  
  void increasePower() {
    if (power <= maxPower) power += 1;
  }

  void resetPower() {
    power = minPower;
  }  

  void fireAway() {
    balls.add(new Ball(pipe.angle, power));
  }
 
  void displayBalls() {
    Iterator<Ball> it = balls.iterator();
    for (int i = balls.size()- 1; i >= 0; i--) {
      Ball ball = balls.get(i);
      ball.display();
      if (ball.isDead()) balls.remove(i);
    }    
  }
  
  void display() {

    displayBalls();

    stroke(0);
    fill(175);    
    pushMatrix();
    rectMode(CENTER);
    translate(location.x, location.y);
    rotate(radians(-1 * angle));
    rect(0, 0, pipeWidth, pipeHeight);
    
    float powerFill = map(power, 1, 50, 5, pipeWidth);
    fill(#00FF00);
    rectMode(CORNER);
    rect(0 - pipeWidth / 2, 0 - pipeHeight / 2, powerFill, pipeHeight);
    
    popMatrix();

    rectMode(CENTER);   
    fill(175);
    rect(location.x, location.y + pipeHeight, 10, 40);
  } 
  
  void update() {
    angle = map(mouseY, 0, height, maxAngle, minAngle);  
  }
  
}
