class Particle extends GameObject{
    
  PVector dir;
  float speed;
  
  Particle(PVector location, int floor) {
    super(location.x, location.y, location.z, 10);
    size = random(5,8);
    speed = 10;
    lives = 600;
    float vx = random(-0.5, 0.5);
    float vy;
    if(floor == 0) 
      vy = random(0, -0.75);
    else if (floor == 1) 
      vy = random(-0.5, 0.5);
    else 
      vy = random(-0.1, -0.75);
    
    float vz = random(-0.5, 0.5);
    dir = new PVector(vx, vy, vz);
    dir.setMag(speed);
  }
  
  void act() {
    dir.y += 0.2;
    if(loc.y >= height - 5) dir.setMag(0);
    loc.add(dir);
    lives--;
  }
  
  void show() 
    {
   world.pushMatrix();
   world.translate(loc.x, loc.y, loc.z);
   world.fill(white, lives/600*255);
   world.strokeWeight(1);
   world.stroke(100, lives/600*255);
   world.box(size);
   world.popMatrix();
  }
}
