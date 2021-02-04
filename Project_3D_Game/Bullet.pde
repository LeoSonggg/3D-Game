class Bullet extends GameObject {
  PVector dir;
  float speed;
  float gravity;
  
  Bullet() {
    super(eyex, eyey, eyez, 10);
    speed = 75;
    float vx = cos(leftRightAngle);
    float vy = tan(upDownAngle);
    float vz = sin(leftRightAngle);
    dir = new PVector(vx, vy, vz);
    dir.setMag(speed);
    gravity = 0.2;
  }
  
  Bullet(float X, float Y, float Z, float VX, float VY, float VZ) {
    super(X, Y, Z, 10);
    speed = 25;
    float vx = VX;
    float vy = VY;
    float vz = VZ;
    dir = new PVector(vx, vy, vz);
    dir.setMag(speed);
    gravity = 0.1;
  }
  
  void act() {
    int hitx = int(loc.x + 2000) / gridSize;
    int hity = int(loc.z + 2000) / gridSize;
    if(loc.y >= height - gridSize*2.3 + 20) {
      if(map.get(hitx, hity) == white) {
        loc.add(dir);  
      } else {
        lives = 0;
        for(int i = 0; i < 15; i++) {
          objects.add(new Particle(loc, 1));
        }
      }
      if(loc.y >= height - 60) {
        lives = 0;
        for(int i = 0; i < 15; i++) {
          objects.add(new Particle(loc, 2));
        }
      }
    }
    else
    loc.add(dir); 
    
    dir.y += gravity;
  }
}
