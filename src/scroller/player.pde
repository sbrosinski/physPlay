class Player {
 
 float posY, posX = 100; 
 PVector location;
 PVector velocity;
 PVector acceleration;
 float mass = 1;
 boolean airborne = false, bounce = false;;
 
 Player() {
   location = new PVector(100, 0);
   velocity = new PVector(0,0);
   acceleration = new PVector(0,0);   
 }
 
 void update(PVector lineVector) {
  println(velocity);

   
   velocity.add(acceleration);
   location.add(velocity);
   acceleration.mult(0); 
 
   // collision with ground line, don't fall below!
   if (location.y >= lineVector.y - 8) {
 
   
        location.y = lineVector.y - 8; 
   
  
  
   } else if (location.y < 0) {
      // collision with top, bounce back down
      location.y = 0;
      applyForce(new PVector(0, 3)); // gravity
   }
   else  
   {
      // in air apply gravity  
   applyForce(new PVector(0, 0.05)); // gravity
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
 
     println("jump!");
     applyForce(new PVector(0, -5));
  
 }
  
  
}
