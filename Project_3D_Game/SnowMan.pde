class SnowMan extends GameObject{
  
  PVector dir;
  float speed;
  
  SnowMan() {
    
    boolean blocked = true;
    while(blocked == true){
      loc.x = random(-2000, 2000);
      loc.z = random(-2000, 2000);
      for(int x = 0; x < map.width; x++) {
        for(int y = 0; y < map.height; y++) {
          color c = map.get(x, y);
          if(c == dullBlue || c == black) {
            if(x == loc.x/gridSize && y == loc.z/gridSize) blocked = true;
            else blocked = false;
          }
        }
      }
    }
    loc.y = height;
  }
  
  void show() {
    world.pushMatrix();
    world.stroke(255, 50);
    world.fill(255);
  
    world.translate(loc.x, loc.y, loc.z);
    world.rotateY(tan((loc.x - eyex) / (loc.z - eyez)));
    //world.rotateX(mouseY * 0.05);
    //world.rotateY(mouseX * 0.05);
    world.sphere(40*2/3);
  
    world.translate(0, 70*2/3, 0);
    world.sphere(45*2/3);
  
    world.translate(0, -140*2/3, 0);
    world.sphere(35*2/3);

    world.stroke(#996633, 50);
    world.fill(#996633);
  
    world.translate(50*2/3, 60*2/3, 0);
    world.rotateZ(radians(-40));
    world.box(40*2/3, 7*2/3, 7*2/3);
    world.rotateZ(radians(40));
  
    world.translate(-100*2/3, 0, 0);
    world.rotateZ(radians(40));
    world.box(40*2/3, 7*2/3, 7*2/3);
    world.rotateZ(radians(-40));
  
    world.translate(65*2/3, -60*2/3, 35*2/3);
    world.box(5*2/3);
  
    world.translate(-30*2/3, 0, 0);
    world.box(5*2/3);
  
    world.popMatrix();
  }
  
  void act() {
    if(loc.y > height-gridSize*1.2) {
      loc.y--;
    }
    
    
  }
}
