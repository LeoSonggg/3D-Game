class Snow extends GameObject {
                  
  Snow() {
    loc.x = random(-2000,2000);
    loc.z = random(-2000,2000);
    loc.y = 0;
    size = 3;
    lives = 1100;
  }
  
  void show() {
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    world.fill(white);
    world.noStroke();
    world.box(size);
    world.popMatrix();
  }
  
  void act() {
    if(loc.y <= height - 5) loc.y ++;
    lives--;  
  }
}
