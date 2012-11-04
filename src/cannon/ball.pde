class Ball {
	Mover mover;
	boolean isDead, hasHit;
	float hitX;
	float hitY;
	int hitTimer = 255;
	PVector gravity = new PVector(0, 0.1);

	Ball(float angle) {
		mover = new Mover();
		float fireX = 40;
		float fireY = -1 * tan(radians(angle)) * fireX;
		//println("x=" + fireX + " - y=" + fireY + " - angle=" + angle);
		PVector fire = new PVector(fireX, fireY);
		mover.applyForce(fire);			
	}

	void display() {
  		

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
			mover.applyForce(gravity);
			mover.update();

			stroke(0);
			fill(175);
			ellipse(mover.location.x, mover.location.y, 16, 16);			
		}

		if (!hasHit && mover.location.x > 20 && mover.location.y > height - 16) {
			hasHit = true;
			hitX = mover.location.x;
			hitY = mover.location.y;

		

		} 

	
	}

}