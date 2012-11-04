import processing.core.*; 
import processing.data.*; 
import processing.opengl.*; 

import Mover; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class cannon extends PApplet {



ArrayList<Ball> balls = new ArrayList<Ball>();
boolean hasFired = false;

public void setup() {
	size(800,200);
}

public void mouseClicked() {
	balls.add(new Ball());
}

public void draw() {
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

	public void draw() {
  		

		if (hasHit && !isDead) {
			stroke(0xffFF0000, hitTimer);
			fill(0xffFF0000, hitTimer);
			ellipse(hitX, hitY, 16, 16);
			hitTimer -= 15;
			if (hitTimer < 0) {
				isDead = true;
			}	

		} else {
			mover.drag(0.01f);
			PVector earth = new PVector(0, 0.1f);
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
class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover() {
    mass = 1;
    location = new PVector(10, height - 10);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }

  // Newton\u2019s second law.
  public void applyForce(PVector force) {
    // Receive a force, divide by mass, and add to acceleration.
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }

  public void drag(float dragCoefficient) {

    float speed = velocity.mag();
    // The force\u2019s magnitude: Cd * v~2~
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

  public void update() {
    velocity.add(acceleration);
    location.add(velocity);
    // clear the acceleration each time!
    acceleration.mult(0);
  }

  public void display() {
    stroke(0);
    fill(175);
    // Let\u2019s scale the size of the object according to its mass.
    ellipse(location.x,location.y,mass*16,mass*16);
  }

  // Somewhat arbitrarily, we are deciding that an object bounces when it hits the edges of a window.
  public void checkEdges() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }

    if (location.y > height) {
      // Even though we said we shouldn't touch location and velocity directly, there are some exceptions.
      // Here we are doing so as a quick and easy way to reverse the direction of our object when it reaches the edge.
      velocity.y *= -1;
      location.y = height;
    }
  }
}
class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover() {
    mass = 1;
    location = new PVector(10, height - 10);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }

  // Newton\u2019s second law.
  public void applyForce(PVector force) {
    // Receive a force, divide by mass, and add to acceleration.
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }

  public void drag(float dragCoefficient) {

    float speed = velocity.mag();
    // The force\u2019s magnitude: Cd * v~2~
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

  public void update() {
    velocity.add(acceleration);
    location.add(velocity);
    // clear the acceleration each time!
    acceleration.mult(0);
  }

  public void display() {
    stroke(0);
    fill(175);
    // Let\u2019s scale the size of the object according to its mass.
    ellipse(location.x,location.y,mass*16,mass*16);
  }

  // Somewhat arbitrarily, we are deciding that an object bounces when it hits the edges of a window.
  public void checkEdges() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }

    if (location.y > xheight) {
      // Even though we said we shouldn't touch location and velocity directly, there are some exceptions.
      // Here we are doing so as a quick and easy way to reverse the direction of our object when it reaches the edge.
      velocity.y *= -1;
      location.y = height;
    }
  }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "cannon" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
