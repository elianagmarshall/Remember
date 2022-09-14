class Walter {
  PImage bwWalterF; //sprite sheet of black & white Walter walking forward
  PImage bwWalter; //image of black & white Walter
  PImage[] walterSpritesF = new PImage[4]; //array to run Walters forward walking animation
  int walterW=64; //Walter's width size
  int walterH=136; //Walter's height size
  int startPosX=1215; //starting x position for Walter
  int startPosY=250; //starting y position for Walter
  int walterX, walterY; //x and y coordinates of Walter
  int walterSpeed=4; //speed of Walter
  int hrBoundaryL=587; //left hospital room boundary for Walter
  int hrBoundaryR=1271; //right hospital room boundary for Walter
  int hrBoundaryU=100; //up hospital room boundary for Walter
  int hrBoundaryD=720; //down hospital room boundary for Walter
  int bedBoundaryX=1245; //horizontal bed boundary for Walter
  int bedBoundaryY=280; //vertical bed boundary for Walter
  float animationSpeed=0.07; //speed of Walter's walking animations
  float animationCounter; //counter for Walter's walking animations
  boolean wPressed, aPressed, sPressed, dPressed; //booleans for if keys 'w', 'a', 's', and/or 'd' is being pressed
  boolean walterLeft, walterRight, walterUp, walterDown; //booleans to determine which direction Walter is facing
  boolean walterIdle; //boolean to determine whether or not Walter is moving
  boolean bedCollision; //boolean to determine if Walter has collided with the bed boundaries

  Walter() {
    bwWalterF=loadImage("bwWalterF.png");
    bwWalter=loadImage("bwWalter.png");

    walterX=startPosX; //sets Walter's starting x position
    walterY=startPosY; //sets Walter's starting y position

    walterSprites(); //initializes Walter's sprite animations
  }

  void walterSprites() {
    for (int index=0; index<walterSpritesF.length; index++) //index variable has an initial value of 0, must be less than the length of t array, and increases by increments of 1
      walterSpritesF[index]=bwWalterF.get(index*walterW, 0, walterW, walterH); //retrieves the separate images from Walter's forward sprite sheet
  }

  void displayWalter() {
    int animationIndex=floor(animationCounter)%walterSpritesF.length;  //index variable to use each image on Walter's forward sprite sheet

    if (walterLeft==false&&walterRight==false&&walterUp==false&&walterDown==false) //if Walter is not moving in any direction
      walterIdle=true; //Walter is idle

    if (walterIdle==true) //if Walter is idle
      image(bwWalter, walterX, walterY); //display black & white Walter standing

    if (walterDown==true && walterIdle==false) { //if Walter is moving down and is not idle
      animationCounter+=animationSpeed; //sets the speed for Walter's downward walking animation
      image(walterSpritesF[animationIndex], walterX, walterY); //display Walter's walking animation moving downwards
    }
  }

  void hrBoundaries() {
    if (walterX<hrBoundaryL) //if Walter is outside of the left hospital room boundary
      walterX+=walterSpeed; //Walter cannot move to the left
    if (walterX>hrBoundaryR) //if Walter is outside of the right hospital room boundary
      walterX-=walterSpeed; //Walter cannot move to the right
    if (walterY<hrBoundaryU) //if walter is outside of the top hospital room boundary
      walterY+=walterSpeed; //Walter cannot move upwards
    if (walterY>hrBoundaryD) //if Walter is outside of the bottom hospital room boundary
      walterY-=walterSpeed; //Walter cannot move downwards

    if (walterY==bedBoundaryY&&walterX>bedBoundaryX) //if Walter is at the foot of the bed
      walterY+=walterSpeed; //Walter cannot move upwards
  }

  void walterMove() {
    if (wPressed) //if 'w' is being pressed
      walterY-=walterSpeed; //Walter moves upwards
    if (aPressed) //if 'a' is being pressed
      walterX-=walterSpeed; //Walter moves to the left
    if (sPressed) //if 's' is being pressed
      walterY+=walterSpeed; //Walter moves downwards
    if (dPressed) //if 'd' is being pressed
      walterX+=walterSpeed; //Walter moves to the right
  }

  void walterKeyPressed() {
    if (key=='w') { //if 'w' is being pressed
      wPressed=true; //'w' is being pressed
      walterIdle=false; //Walter is not idle
      //  walterUp=true; //Walter is facing upwards
      // walterLeft=false; //walter is not facing left
      // walterRight=false; //Walter is not facing right
      walterDown=false; //Walter is not facing downwards
    }
    if (key=='a') { //if 'a' is being pressed
      aPressed=true; //'a' is being pressed
      walterIdle=false; //Walter is not idle
      // walterUp=false; //Walter is not facing upwards
      // walterLeft=true; //Walter is facing left
      // walterRight=false; //Walter is not facing right
      walterDown=false;  //Walter is not facing downwards
    }
    if (key=='s') { //if 's' is being pressed
      sPressed=true; //'s' is being pressed
      walterIdle=false; //Walter is not idle
      // walterUp=false; //Walter is not facing upwards
      // walterLeft=false; //Walter is not facing left
      // walterRight=false; //Walter is not facing right
      walterDown=true; //Walter is facing downwards
    }
    if (key=='d') { //if 'd' is being pressed
      dPressed=true; //'d' is being pressed
      walterIdle=false; //Walter is not idle
      //  walterUp=false; //Walter is not facing upwards
      //  walterLeft=false; //Walter is not facing left
      //walterRight=true; Walter is facing right
      walterDown=false; //Walter is not faacing downwards
    }
  }

  void walterKeyReleased() {
    if (key=='w') { //if 'w' is released
      wPressed=false; //'w' is not being pressed
      walterIdle=true; //Walter is idle
    }
    if (key=='a') { //if 'a' is released
      aPressed=false; //'a' is not being pressed
      walterIdle=true; //Walter is idle
    }
    if (key=='s') { //if 's' is released
      sPressed=false; //'s' is not being pressed
      walterIdle=true; //Walter is idle
    }
    if (key=='d') { //if 'd' is released
      dPressed=false; //'d' is not being pressed
      walterIdle=true; //Walter is idle
    }
  }
}
