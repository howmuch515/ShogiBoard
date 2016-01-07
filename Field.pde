class Field {
  int wH;
  int wW;
  int XOFFSET, YOFFSET;
  PImage fieldImage; 
  Trout hasTrout[][] = new Trout[9][9];

  Field(int wW, int wH) {
    this.wH = wH;
    this.wW = wW;
    XOFFSET = (width - wW) / 2;
    YOFFSET = (height - wH) / 2;

    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        int zone = 0;
        if ( 0 <= j && j < 3) zone = -1;
        else if (3 <= j && j < 6) zone = 0;
        else if (6 <= j && j < 9) zone = 1;
        hasTrout[i][j] = new Trout(i*wW/9 + XOFFSET, j*wH/9 + YOFFSET, wW/9, wH/9, zone);
      }
      fieldImage = loadImage("img/field.png");
    }
  }

  Trout[][] getTrout() {
    return hasTrout;
  }

  int getTroutWidth() {
    return wW / 9;
  }

  int getTroutHeight() {
    return wH / 9;
  }

  Trout getTroutOnMouse() {
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        if (hasTrout[i][j].onMouse()) {
          return hasTrout[i][j];
        }
      }
    }
    return null;
  }

  void printJPNum(int X, int Y, int offset) {
    String JPNumList[] = {"一", "二", "三", "四", "五", "六", "七", "八", "九"};
    textSize(20);
    fill(0, 0, 0);
    for (int i=0; i<9; i++) {
      text(JPNumList[i], X, Y+offset*i);
    }
  }
  
  void printNum(int X, int Y, int offset) {
    textSize(20);
    fill(0,0,0);
    for (int i=0; i<9; i++) {
      text(9-i, X+offset*i, Y);
    }
  }

  void showUp() {
    //noFill();
    fill(#DEB887);
    noStroke();
    rectMode(CENTER);
    rect(width/2, height/2, wW + 60, wH + 90);
   textSize(20);
    stroke(1);

    //rect(XOFFSET, YOFFSET, wW + 50, wH + 50);
    //image(fieldImage, XOFFSET, YOFFSET, wW + 50, wH + 50);
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        hasTrout[i][j].showUp();
      }
    }
    //printJPNum(width-XOFFSET+8, YOFFSET+25, wH/9);
    //printNum(XOFFSET+20, YOFFSET-5, wW/9);
  }
  
  
  void reset() {
    for(int i=0; i<9; i++) {
      for(int j=0; j<9; j++) {
        hasTrout[i][j].onPiece = false;
      }
    }
  }
    
}