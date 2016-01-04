class SwitchButton {
  int px, py, sizeX, sizeY;
  boolean IO;
  String label;
  color BLUE = #0000ff;
  color RED = #ff0000;
  SwitchButton(int px, int py, int sizeX, int sizeY, boolean IO, String label) {
    this.px = px;
    this.py = py;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    this.IO = IO;
    this.label = label;
  }

  void putButton() {
    if (overCircle(px, py, sizeX)) IO = !IO;
  }

  boolean overCircle(int x, int y, int diameter) {
    float disX = x - mouseX;
    float disY = y - mouseY;
    if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
      return true;
    } else {
      return false;
    }
  }
  void showUp() {
    noStroke();
    textSize(15);
    if (IO) fill(BLUE);
    else fill(RED);
    rectMode(CENTER);
    rect(px,py,sizeX,sizeY);
    textAlign(CENTER);
    fill(#000000);
    text(label, px, py, sizeX, sizeY);
    if (IO) fill(RED);
    else fill(BLUE);
    ellipseMode(CENTER);
    ellipse(px-sizeX/2+sizeY/2, py, sizeY, sizeY);
  }
}

class ClickButton {
  int px, py, sizeX, sizeY;
  color col;
  String label;
  ClickButton(int px, int py, int sizeX, int sizeY, color col, String label) {
    this.px = px;
    this.py = py;
    this.col = col;
    this.label = label;
    this.sizeY = sizeY;
    this.sizeX = sizeX;
  }

  void showUp() {
    fill(col);
    noStroke();
    rectMode(CENTER);
    textSize(15);
    rect(px, py, sizeX, sizeY);
    fill(0);
    text(label, px, py, sizeX, sizeY); 
    noFill();
  }

  boolean overButton() {
    return abs(px - mouseX) <= sizeX/2 && abs(py - mouseY) <= sizeY/2;
  }
  
  void putButton() {
    if(overButton()) {
      switch(label) {
        case "UNDO":
          log.UNDO();
          break;
        case "REDO":
          log.REDO();
          break;
        case "RESET":
          reset();
          break;
        default:
          break;
      }
    }
  }
}