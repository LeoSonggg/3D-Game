void keyPressed() {
  if(mode == INTRO) {
    introPressed();
  } else if (mode == GAME) {
    gamePressed();
  } else if (mode == PAUSE) {
    pausePressed();
  } else if (mode == GAMEOVER) {
    gameoverPressed();
  } else {
      println("ERROR! Mode is:" + mode); 
  }
}

void keyReleased() {
  if(mode == INTRO) {
    introReleased();
  } else if (mode == GAME) {
    gameReleased();
  } else if (mode == PAUSE) {
    pauseReleased();
  } else if (mode == GAMEOVER) {
    gameoverReleased();
  } else {
      println("ERROR! Mode is:" + mode); 
  }
}
