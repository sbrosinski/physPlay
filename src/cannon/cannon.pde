
Pipe pipe;
ArrayList<Ball> balls = new ArrayList<Ball>();
boolean hasFired = false;

void setup() {
	size(400,200);
	pipe = new Pipe();
}

void mouseClicked() {
	balls.add(new Ball(pipe.angle));
}

void keyPressed() {
	balls.add(new Ball(pipe.angle));
}

void draw() {
	background(255);
	Iterator<Ball> it = balls.iterator();
  	while (it.hasNext()) {
  		Ball ball = it.next();
  		ball.display();
  		// this doesn't work in processing-js, investigate
  		//if (ball.isDead) it.remove();
  		
  	}

 	pipe.update();
  	pipe.display();
			
}




