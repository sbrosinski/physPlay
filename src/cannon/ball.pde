class Ball {

	Mover mover;
	boolean hasHit;
	float hitX;
	float hitY;
	float power;
	int hitTimer = 255;
	PVector gravity = new PVector(0, 0.1);
	ParticleSystem explosion;

	Ball(float angle, float power) {
		mover = new Mover();
		float fireX = power;
		float fireY = -1 * tan(radians(angle)) * fireX;
		PVector fire = new PVector(fireX, fireY);
		mover.applyForce(fire);			
	}

	void display() {
		if (hasHit) {
			if (explosion == null) {
				explosion = new ParticleSystem(new PVector(hitX, hitY));
				explosion.addParticle(10);
			} else {
                        explosion.run();
}

		} else {
			mover.drag(0.007);
			mover.applyForce(gravity);
			mover.update();

			stroke(0);
			fill(175);
			ellipse(mover.location.x, mover.location.y, 16, 16);			
		}

		if (!hasHit && mover.location.x > 80 && mover.location.y > height - 5) {
			hasHit = true;
			hitX = mover.location.x;
			hitY = mover.location.y;
		} 
	}

  boolean isDead() {
    return explosion != null && explosion.isDead();
  }
}
