void drawCrosshair() {
  HUD.stroke(white);
  HUD.strokeWeight(5);
  HUD.line(width/2 - 20, height/2, width/2 + 20, height/2);
  HUD.line(width/2, height/2 - 20, width/2, height/2 + 20);
}

void drawMinimap() {
  HUD.image(map, 50, 50, 160, 160);
  
  fill(255);
  HUD.textSize(20);
  HUD.text("X: " + int(eyex + 2000) / gridSize, 50, 230);
  HUD.text("Y: " + int(eyez + 2000) / gridSize, 50, 250);
  
  HUD.strokeWeight(1);
  HUD.stroke(255, 0, 0);
  HUD.fill(255, 0, 0);
  HUD.rect(int(eyex + 2000) / gridSize *4 + 50, int(eyez + 2000) / gridSize *4 + 50, 4, 4); //Indicator of my location
}
