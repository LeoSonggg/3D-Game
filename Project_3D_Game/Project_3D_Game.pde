import java.awt.Robot;

//color pallette
color black = #000000;  //oak planks
color white = #FFFFFF;  //empty space
color dullBlue = #7092BE;  //mossy bricks

//textures
PImage mossyStone;
PImage oakPlanks;

//Map variables
int gridSize;
PImage map;

//Robot for mouse control
Robot rbt;

//camera variables
float eyex, eyey, eyez;
float focusx, focusy, focusz; 
float upx, upy, upz;

boolean wkey, akey, skey, dkey, spacekey;

//rotation variable
float leftRightAngle;
float upDownAngle;

//Game Object
ArrayList<GameObject> objects;

//canvases
PGraphics world;
PGraphics HUD;

//Bullet cool down between each shot
int time = 0;

void setup() {
  //create canvases
  world = createGraphics(width, height, P3D);
  HUD = createGraphics(width, height, P2D);
  
  //create game object list
  objects = new ArrayList<GameObject>();
  
  //load texture
  mossyStone = loadImage("Mossy_Stone_Bricks.png");
  oakPlanks = loadImage("Oak_Planks.png");
  world.textureMode(NORMAL);
  
  //noCursor();
  try {
    rbt = new Robot(); 
  }
  catch(Exception e) {
    e.printStackTrace();  
  }
  size(displayWidth, displayHeight, P2D); 
  
  eyex = width/2;
  eyey = 9*height/11;
  eyez = height/2;
  
  focusx = eyex;
  focusy = eyey;
  focusz = eyez - 100;
  
  upx = 0;
  upy = 1;
  upz = 0;
  
  map = loadImage("map.png");
  gridSize = 100;
  
  objects.add(new SnowMan());
}

void draw() {
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
}
