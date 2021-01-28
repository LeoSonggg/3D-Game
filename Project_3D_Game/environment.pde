void drawMap() {
  for(int x = 0; x < map.width; x++) {
    for(int y = 0; y < map.height; y++) {
      color c = map.get(x, y);
      if(c == dullBlue || c == black) {
        for(int i = 1; i < 3; i++) {
          texturedCube(x*gridSize - 2000, height-gridSize*i, y*gridSize - 2000, mossyStone, gridSize);
        }
        world.pushMatrix();
        world.translate(x*gridSize - 1950, height-gridSize*2 - 10, y*gridSize - 1950);
        world.fill(220);
        world.stroke(200);
        world.box(gridSize, 20, gridSize);
        world.popMatrix();
      }
    }
  }
}

//void drawInterface() {
//  stroke(255, 0, 0);
//  strokeWeight(5);
//  line(width/2 - 15, height/2, width/2 + 15, height/2);
//  line(width/2, height/2 - 15, width/2, height/2 + 15);
//}

//void drawAxis() {
//  world.stroke(255,0,0);
//  world.strokeWeight(5);
//  world.line(0,0,0, 1000,0,0); //x axis
//  world.line(0,0,0, 0,1000,0); //y axis
//  world.line(0,0,0, 0,0,1000); //z axis
//}

void drawFloor(int floorStart, int floorEnd, int floorHeight, int floorSpacing) {
  stroke(255);
  strokeWeight(3);
  for(int i = floorStart; i < floorEnd; i += floorSpacing) 
    for(int f = floorStart; f < floorEnd; f += floorSpacing) 
      texturedCube(i, floorHeight, f, mossyStone, floorSpacing);
  
  //for(int i = floorStart; i < floorEnd; i += floorSpacing) {
  //  line(i, floorHeight, floorStart, i, floorHeight, floorEnd);
  //  line(floorStart, floorHeight, i, floorEnd, floorHeight, i);
  //}
  //line(width/2 -100, height, -1000, width/2 -100, height, 1000);
  //line(width/2 +100, height, -1000, width/2 +100, height, 1000);
}

void drawSnowFloor(int floorStart, int floorEnd, int floorHeight, int floorSpacing) {
  stroke(255);
  strokeWeight(3);
  for(int i = floorStart; i < floorEnd; i += floorSpacing) {
    for(int f = floorStart; f < floorEnd; f += floorSpacing) {
      world.pushMatrix();
      world.translate(i, floorHeight, f);
      world.fill(220);
      world.stroke(200);
      world.box(gridSize);
      world.popMatrix();
    }
  }
}
