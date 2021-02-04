class SnowMan extends GameObject{
  
  PVector dir;
  float speed;
  int coolDown;
  boolean melee;
  
  SnowMan(float Melee) {
    if(Melee > 1)
      melee = true;
    else
    melee = false;
    boolean blocked = true;
    while(blocked == true){
      loc.x = random(-1000, 1000);
      loc.z = random(-1000, 1000);
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
    coolDown = 0;
  }
  
  void show() {
    world.pushMatrix();
    world.stroke(255, 50);
    //world.noFill();
    world.fill(255);
  
    world.translate(loc.x, loc.y, loc.z);
    
    if(loc.z < eyez)
      world.rotateY(atan((loc.x - eyex) / (loc.z - eyez)));
    else 
      world.rotateY(atan((loc.x - eyex) / (loc.z - eyez))+PI);
    
    
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
  
    if(!melee){
      world.fill(255);
      world.translate(-20.43*1.9/3, -17.14*1.9/3, 0);
      world.box(7);
      world.translate(20.43*1.9/3, 17.14*1.9/3, 0);
    }
    
    world.stroke(0, 50);
    world.fill(0);
    
    world.translate(65*2/3, -60*2/3, 35*2/3);
    world.box(5*2/3);
  
    world.translate(-30*2/3, 0, 0);
    world.box(5*2/3);
    
    //world.translate(30*2/3, 0, -70*2/3);
    //world.box(5*2/3);
    
    //world.translate(-30*2/3, 0, 0);
    //world.box(5*2/3);
  
    world.popMatrix();
  }
  
  void act() {
    if(loc.y > height-gridSize*1.2) {
      loc.y--;
    }
    
    if(!melee) {
      coolDown++;
      if(coolDown == 120) {
        objects.add(new Bullet(loc.x, loc.y, loc.z, (eyex - loc.x), -70, (eyez - loc.z)));
      
        coolDown = 0;           
      }
    }
    
    if(melee && sqrt(sq(loc.x - eyex) + sq(loc.z - eyez)) > 100){
      loc.x += (eyex - loc.x)/360;
      loc.z += (eyez - loc.z)/360;
    }  
    else if(sqrt(sq(loc.x - eyex) + sq(loc.z - eyez)) > 1100){
      loc.x += (eyex - loc.x)/360;
      loc.z += (eyez - loc.z)/360;
    }
  }
}
