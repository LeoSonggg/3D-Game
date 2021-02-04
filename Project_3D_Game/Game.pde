void game() {  
  world.beginDraw();
  world.textureMode(NORMAL);
  world.background(#99ccff);
  
  //world.pointLight(255, 255, 255, eyex, eyey, eyez);
  world.camera(eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz);
  
  move();
  drawSnowFloor(-2000, 2000, height, gridSize);  //floor
  drawMap();
  
  for(int i = 0; i < 3; i++) 
    objects.add(new Snow());  
  
  int i = 0;
  while(i < objects.size()) {
    GameObject obj = objects.get(i);
    obj.act();
    obj.show();
    if(obj.lives == 0) {
      objects.remove(i);
    } else {
      i++; 
    }
  }
  world.endDraw();
  image(world, 0, 0);
  
  HUD.beginDraw();
  HUD.clear();
  drawCrosshair();
  drawMinimap();
  HUD.endDraw();
  image(HUD, 0, 0);
  
  buttonPause(width/2, height/40, 30, 30);
}

void gameClicks() {
  if (buttonPressed(width/2, height/40, 30, 30))
    mode = PAUSE;
}

void gamePressed() {
  if(key == 'w' || key == 'W') wkey = true;
  if(key == 'a' || key == 'A') akey = true;
  if(key == 's' || key == 'S') skey = true;
  if(key == 'd' || key == 'D') dkey = true;
  if(key == ' ' || key == ' ') spacekey = true;
}

void gameReleased() {
  if(key == 'w' || key == 'W') wkey = false;
  if(key == 'a' || key == 'A') akey = false;
  if(key == 's' || key == 'S') skey = false;
  if(key == 'd' || key == 'D') dkey = false;
  if(key == ' ' || key == ' ') spacekey = false;
}
