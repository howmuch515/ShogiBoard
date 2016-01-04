class SwitchButton {
  int px, py, sizeX, sizeY, buttonPx, buttonPy;
  boolean IO;
  String label;
  color BLUE = #0000ff;
  color RED = #ff0000;
  color WHITE = #ffffff;
  color BLACK = #000000;
  
  SwitchButton(int px, int py, int sizeX, int sizeY, boolean IO, String label) {
    this.px = px;
    this.py = py;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    this.IO = IO;
    this.label = label;
    this.buttonPx = px-sizeX/2+sizeY/2;
    this.buttonPy = py;
  }

  void putButton() {
    if (overCircle(px, py, sizeX)) IO = !IO;
  }

  boolean overCircle(int x, int y, int diameter) {
    return dist(buttonPx, buttonPy, mouseX, mouseY) <= sizeY/2;
  }
  
  void showUp() {
    noStroke();
    textSize(15);
    if (IO) fill(BLUE);
    else fill(RED);
    rectMode(CENTER);
    rect(px,py,sizeX,sizeY);
    textAlign(CENTER);
    
    if (IO) fill(WHITE);
    else fill(BLACK);
    text(label, px, py, sizeX, sizeY);
    
    if (IO) fill(RED);
    else fill(BLUE);
    ellipseMode(CENTER);
    ellipse(buttonPx, buttonPy, sizeY, sizeY);
  }
}

class ClickButton {
  int px, py, sizeX, sizeY;
  color bgCol, textCol;
  String label;
  ClickButton(int px, int py, int sizeX, int sizeY, color bgCol, color textCol, String label) {
    this.px = px;
    this.py = py;
    this.bgCol = bgCol;
    this.textCol = textCol;
    this.label = label;
    this.sizeY = sizeY;
    this.sizeX = sizeX;
  }

  void showUp() {
    fill(bgCol);
    noStroke();
    rectMode(CENTER);
    textSize(15);
    rect(px, py, sizeX, sizeY);
    fill(0);
    fill(textCol);
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