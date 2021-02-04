void gameover() {
  background(0);
  
  if(hitpoint <= 0){
    fill(255);
    textSize(100);
    text("GAME OVER", 400, 200);
  }
  else {
    fill(255);
    textSize(100);
    text("You Win!", 400, 200);
  }
  
  button(400, 525, 200, 50, 30, 150, #FF0000, "RESTART");
}

void gameoverClicks() {
  if(buttonPressed(400,525,200,50)) {
    mode = INTRO;
    wkey = akey = skey = dkey = spacekey = false;
    time = 0;
    hitpoint = 10;
  }
}

void gameoverPressed() {
  
}

void gameoverReleased() {
  
}
