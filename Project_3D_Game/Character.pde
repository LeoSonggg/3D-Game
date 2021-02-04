void move() {
  
  if(akey && canMoveLeft()) {
    eyex -= cos(leftRightAngle + PI/2)*10;
    eyez -= sin(leftRightAngle + PI/2)*10;
  }
  
  if(dkey && canMoveRight()) {
    eyex += cos(leftRightAngle + PI/2)*10;
    eyez += sin(leftRightAngle + PI/2)*10;
  }
  
  if(wkey && canMoveForward()) {
    eyex += cos(leftRightAngle)*10;
    eyez += sin(leftRightAngle)*10;
  }
  
  if(skey && canMoveBack()) {
    eyex -= cos(leftRightAngle)*10;
    eyez -= sin(leftRightAngle)*10;
  }
  
  if(time < 20) 
    time ++;
  
  if(spacekey && time == 20) {
    objects.add(new Bullet());  
    time = 0;
  }
  
  //leftRightAngle += (mouseX - pmouseX)*0.01;
  //upDownAngle += (mouseY - pmouseY)*0.01;
  if(upDownAngle > PI/2.5) upDownAngle = PI/2.5;
  if(upDownAngle < -PI/2.5) upDownAngle = -PI/2.5;
  
  if(mouseX > width-2) rbt.mouseMove(3, mouseY);
  if(mouseX < 2) rbt.mouseMove(width-3, mouseY);
  
  focusx = eyex + cos(leftRightAngle)*300;
  focusy = eyey + tan(upDownAngle)*300;
  focusz = eyez + sin(leftRightAngle)*300;
  
  if(abs(mouseX - pmouseX) < width - 10) leftRightAngle += (mouseX - pmouseX)*0.01;
  upDownAngle += (mouseY - pmouseY)*0.01;
}

boolean canMoveForward() {
  float fwdx, fwdy, fwdz;
  int mapx, mapy;
  fwdx = eyex + cos(leftRightAngle)*200;
  fwdy = eyey;
  fwdz = eyez + sin(leftRightAngle)*200;
  
  mapx = int(fwdx + 2000) / gridSize;
  mapy = int(fwdz + 2000) / gridSize;
  
  if(map.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
}

boolean canMoveLeft() {
  float leftx, lefty, leftz;
  int mapx, mapy;
  leftx = eyex - cos(leftRightAngle+PI/2)*200;
  lefty = eyey;
  leftz = eyez - sin(leftRightAngle+PI/2)*200;
  
  mapx = int(leftx + 2000) / gridSize;
  mapy = int(leftz + 2000) / gridSize;
  
  if(map.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
}

boolean canMoveRight() {
  float rightx, righty,rightz;
  int mapx, mapy;
  rightx = eyex - cos(leftRightAngle-PI/2)*200;
  righty = eyey;
  rightz = eyez - sin(leftRightAngle-PI/2)*200;
  
  mapx = int(rightx + 2000) / gridSize;
  mapy = int(rightz + 2000) / gridSize;
  
  if(map.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
}

boolean canMoveBack() {
  float backx, backy, backz;
  int mapx, mapy;
  backx = eyex + cos(leftRightAngle+PI)*200;
  backy = eyey;
  backz = eyez + sin(leftRightAngle+PI)*200;
  
  mapx = int(backx + 2000) / gridSize;
  mapy = int(backz + 2000) / gridSize;
  
  if(map.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
}
