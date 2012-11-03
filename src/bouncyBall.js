function bouncyBall(p) {

	var balls = [];

	p.draw = function() {
  	p.background(255);
  	for(var i = 0; i < 10; i++) {
  		balls[i].update()
  		balls[i].draw();
  	}


	}

	p.setup = function() {
		p.size(400,200);
  	for(var i = 0; i < 10; i++) {
  		balls.push(new Ball(p));
  	}
	}

}

function Ball(p) {
	var x = Math.floor(Math.random() * p.width);
	var y = Math.floor(Math.random() * p.height);
	this.mover = new Mover(p, {x: x, y: y}, {vx: 1, vy: 2});
}
Ball.prototype.draw = function() {
	p.stroke(0);
	p.fill(175);
	p.ellipse(this.mover.location.x, this.mover.location.y, 16, 16);	
}
Ball.prototype.update = function() {
	this.mover.update();
	this.mover.checkEdges();	
}