function Mover(p, loc, vel) {
	this.location = new p.PVector(loc.x, loc.y)
	this.velocity = new p.PVector(vel.vx, vel.vy);
	this.acceleration = new p.PVector();
	this.topspeed = 3;
	this.time = 0;
}

Mover.prototype.update = function() {
	this.speedupX = p.map(p.noise(this.time), 0, 1, -2, 2);
	this.speedupY = p.map(p.noise(this.time + 300), 0, 1, -2, 2);
	//this.acceleration.add(new p.PVector(this.speedupX, this.speedupY));	

	this.velocity.add(this.acceleration);
 	this.velocity.limit(this.topspeed);
	this.location.add(this.velocity);

	this.time += 0.4;
}

Mover.prototype.checkEdges = function() {
	if ((this.location.x > p.width) || (this.location.x < 0)) {
  	this.velocity.x = this.velocity.x * -1;
	}
	
	if ((this.location.y > p.height) || (this.location.y < 0)) {
  	this.velocity.y = this.velocity.y * -1;
	}
}




