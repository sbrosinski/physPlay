function cannon(p) {

	var mover;
	var power = 2;
	var clickies = 0;
	var hitx, hity, hasHit = false;

	p.draw = function() {
  	p.background(255);
  	if (this.clickies === 0) return;

		this.mover.drag(0.01);


		var earth = new p.PVector(0, 0.2);

	
		this.mover.applyForce(earth);
		this.mover.update();

		if (!hasHit && isHit(this.mover.location.x, this.mover.location.y)) {
			this.hitx = this.mover.location.x;
			this.hity = this.mover.location.y;
			hasHit = true;
			p.stroke(100);
			p.fill(175);
			p.ellipse(this.hitx, this.hity, 16, 16);				
		} else {
			p.stroke(0);
			p.fill(175);
			p.ellipse(this.mover.location.x, this.mover.location.y, 16, 16);	
		}
	}


	function isHit(x, y) {
		if (x > p.width - 25 && x > 10 || y > p.height - 25)
			return true;
		else
			return false;
	}

	p.mouseClicked = function() {
		this.clickies = this.clickies +  1;
	}

	p.setup = function() {
		p.size(800,200);
		var location = new p.PVector(10, p.height - 10);
		this.mover = new Mover(p, location);
		var fire = new p.PVector(20, -20);
		this.mover.applyForce(fire);
	}

}
