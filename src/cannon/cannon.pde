import Mover;

ArrayList<Ball> balls = new ArrayList<Ball>();
boolean hasFired = false;

void setup() {
	size(800,200);
}

void mouseClicked() {
	balls.add(new Ball());
}

void draw() {
	background(255);
	Iterator<Ball> it = balls.iterator();
  	while (it.hasNext()) {
  		Ball ball = it.next();
  		ball.draw();
  		if (ball.isDead) it.remove();
  		
  	}
			
}

class Ball {
	Mover mover;
	boolean isDead, hasHit;
	float hitX;
	float hitY;
	int hitTimer = 255;

	Ball() {
		mover = new Mover();
		PVector fire = new PVector(40, -20);
		mover.applyForce(fire);			
	}

	void draw() {
  		

		if (hasHit && !isDead) {
			stroke(#FF0000, hitTimer);
			fill(#FF0000, hitTimer);
			ellipse(hitX, hitY, 16, 16);
			hitTimer -= 15;
			if (hitTimer < 0) {
				isDead = true;
			}	

		} else {
			mover.drag(0.01);
			PVector earth = new PVector(0, 0.1);
			mover.applyForce(earth);
			mover.update();

			stroke(0);
			fill(175);
			ellipse(mover.location.x, mover.location.y, 16, 16);			
		}

		if (!hasHit && mover.location.x > 20 && mover.location.y > height - 16) {
			println("is dead");
			hasHit = true;
			hitX = mover.location.x;
			hitY = mover.location.y;

		

		} 

	
	}

}
