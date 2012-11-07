
Pipe pipe;
ArrayList<Ball> balls = new ArrayList<Ball>();
boolean hasFired = false;
float maxPower = 50, minPower = 1, power = minPower;
boolean mouseIsPressed;

void setup() {
	size(400,200);
	pipe = new Pipe();
}

void mousePressed() {
  mouseIsPressed = true;
}

void mouseReleased() {
  mouseIsPressed = false;
  pipe.fireAway();
  pipe.resetPower();
}

void keyPressed() {
  pipe.increasePower();
}

void keyReleased() {
  pipe.fireAway();
  pipe.resetPower();
}

void draw() {
	background(255);
	
if (mouseIsPressed) pipe.increasePower();
  pipe.update();
  pipe.display();
}




