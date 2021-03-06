class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover() {
    mass = 1;
    location = new PVector(30, height - 20);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }

  // Newton’s second law.
  void applyForce(PVector force) {
    // Receive a force, divide by mass, and add to acceleration.
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }

  void drag(float dragCoefficient) {

    float speed = velocity.mag();
    // The force’s magnitude: Cd * v~2~
    float dragMagnitude = dragCoefficient * speed * speed;

    PVector drag = velocity.get();
    drag.mult(-1);
    // The force's direction: -1 * velocity
    drag.normalize();

    // Finalize force: magnitude and direction together
    drag.mult(dragMagnitude);

    // Apply the force
    applyForce(drag);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    // clear the acceleration each time!
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    fill(175);
    //  scale the size of the object according to its mass.
    ellipse(location.x,location.y,mass*16,mass*16);
  }

  void checkEdges() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }

    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    }
  }
}
