class ParticleSystem {

  ArrayList<Particle> particles;  
  PVector origin;

  ParticleSystem(PVector location) {
    origin = location.get();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(origin));
  }
  
  void addParticle(int count) {
    for (int i = 0; i < count; i++) {
      particles.add(new Particle(origin));
    }
  }

  void run() {
    Iterator<Particle> it = particles.iterator();
    for (int i = particles.size()- 1; i >= 0; i--) {
      Particle particle = particles.get(i);
      particle.run();
      if (particle.isDead()) particles.remove(i);
    }        
  }
  
  boolean isDead() {
    return particles.size() == 0;
  }
}
