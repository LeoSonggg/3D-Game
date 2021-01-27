void drawMap() {
  for(int x = 0; x < map.width; x++) {
    for(int y = 0; y < map.height; y++) {
      color c = map.get(x, y);
      if(c == dullBlue || c == black) {
        for(int i = 1; i < 4; i++) 
          texturedCube(x*gridSize - 2000, height-gridSize*i, y*gridSize - 2000, mossyStone, gridSize);
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

void drawAxis() {
  stroke(255,0,0);
  strokeWeight(1);
  line(0,0,0, 1000,0,0); //x axis
  line(0,0,0, 0,1000,0); //y axis
  line(0,0,0, 0,0,1000); //z axis
}

void drawFloor(int floorStart, int floorEnd, int floorHeight, int floorSpacing) {
  stroke(255);
  strokeWeight(3);
  for(int i = floorStart; i < floorEnd; i += floorSpacing) 
    for(int f = floorStart; f < floorEnd; f += floorSpacing) 
      texturedCube(i, floorHeight, f, oakPlanks, floorSpacing);
  
  //for(int i = floorStart; i < floorEnd; i += floorSpacing) {
  //  line(i, floorHeight, floorStart, i, floorHeight, floorEnd);
  //  line(floorStart, floorHeight, i, floorEnd, floorHeight, i);
  //}
  //line(width/2 -100, height, -1000, width/2 -100, height, 1000);
  //line(width/2 +100, height, -1000, width/2 +100, height, 1000);
}
