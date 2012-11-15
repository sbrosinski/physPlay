class Player {
 
 float posY, posX = 50; 
 PVector location;
 PVector velocity;
 PVector acceleration;
 float mass = 1;
 boolean airborne = false, bounce = false;;
 
 Player() {
   location = new PVector(50, 0);
   velocity = new PVector(0,0);
   acceleration = new PVector(0,0);   
 }
 
 void update(PVector lineVector) {
   applyForce(new PVector(0, 0.2)); // gravity
   
   velocity.add(acceleration);
   location.add(velocity);
   acceleration.mult(0); 
 
   // collision with ground line, don't fall below!
   if (location.y >= lineVector.y - 8) {
     if (airborne) {
        airborne = false; // we landed on the line 
        println("landed");
        location.y = lineVector.y - 8; 
     } else {
       location.y = lineVector.y - 8; 
  
     }
   }
 }
 
 void display() {
   stroke(0);
   fill(0);
   ellipse(location.x, location.y, 16, 16);  
 }
 
  void applyForce(PVector force) {
   PVector f = PVector.div(force,mass);
   acceleration.add(f);
  }
  
 void jump() {
   if (!airborne) {
     airborne = true;
     println("jump!");
     applyForce(new PVector(0, -40));
   }
 }
  
  
}
