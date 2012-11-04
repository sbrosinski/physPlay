Pipe pipe;

void setup() {
  size(400, 200);
  pipe = new Pipe();
}

void draw() {
  background(255);
  pipe.update();
  pipe.display();
}
