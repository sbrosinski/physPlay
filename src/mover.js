function Mover(p, loc) {
	this.location = loc;
	this.velocity = new p.PVector();
	this.acceleration = new p.PVector();
	this.mass = 5;
}

Mover.prototype.update = function() {

	this.velocity.add(this.acceleration);
	this.location.add(this.velocity);

	this.acceleration.mult(0);
}

Mover.prototype.checkEdges = function() {
	if ((this.location.x > p.width) || (this.location.x < 0)) {
  	this.velocity.x = this.velocity.x * -1;
	}
	
	if ((this.location.y > p.height) || (this.location.y < 0)) {
  	this.velocity.y = this.velocity.y * -1;
	}
}

Mover.prototype.applyForce = function(force) {
	var f = force.get();
	f.div(this.mass);
	this.acceleration.add(f);	
}

Mover.prototype.drag = function(dragCoefficient) {
	var speed = this.velocity.mag();
	var dragMagnitude = dragCoefficient * speed * speed;
	var drag = this.velocity.get();
	drag.mult(-1);
	drag.normalize();
	drag.mult(dragMagnitude);
	this.applyForce(drag);
}


