float t = 0.0;
float speed = 0.00, maxSpeed = 0.01;
Player player;

void setup() {
  size(800, 400);
  player = new Player();
}

void keyPressed() {
  if (key == 'd') {
    if (speed < maxSpeed) speed += 0.0005;  
  }
  if (key == 'a') {
    if (speed >= 0.0005) speed -= 0.0005;  
  }

}

void mouseClicked() {
  player.jump(); 
}

void draw() {

   background(255);
  // Starting point for graph
  float xoff = t;
  for (int i = 0; i < width; i += 5) {
    stroke(0);
    strokeWeight(1);
    // Get current and "next" noise value
    float y1 = noise(xoff) * height/2 + height/2;
    float y2 = noise(xoff+0.01) * height/2 +  height/2 ;
    // Draw line
    line(i,y1,i+5,y2);
    // Increment xoff
    xoff += 0.008;

    if (i <= player.posX && player.posX <= i+5) {
      player.update(new PVector(50, y1));
    }
    player.display();
    
  }
  // Increment "time" for whole graph
  t+= speed;
  
  
}
