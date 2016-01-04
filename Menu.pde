class Menu {
  int px, py, px2, py2;
  color bgcol;
  SwitchButton TurningSwitch;
  ClickButton ResetButton;
  ClickButton UndoButton;
  ClickButton RedoButton;

  Menu(int px, int py, int px2, int py2, color bgcol) {
    this.px = px;
    this.py = py;
    this.px2 = px2;
    this.py2 = py2;
    this.bgcol = bgcol;
    TurningSwitch = new SwitchButton(px - (px - px2)/2, 100,200, 20, true, "TURNING");
    ResetButton = new ClickButton(px - (px - px2)/2 , 300, 70, 30, #00ff00, "RESET");
    UndoButton  = new ClickButton(px - (px - px2)*3/4, 200,70, 30, #0000ff, "UNDO");
    RedoButton  = new ClickButton(px -(px - px2)/4, 200, 70, 30, #ff0000, "REDO");
  }

  void showUp() {
    fill(bgcol);
    noStroke();
    rectMode(CORNERS);
    rect(px, py, px2, py2);
    TurningSwitch.showUp();
    ResetButton.showUp();
    UndoButton.showUp();
    RedoButton.showUp();
    fill(#000000);
    textSize(20);
    text("MENU", (px+px2)/2, py+30, 100, 50);
  }
  
  void putButton() {
    TurningSwitch.putButton();
    ResetButton.putButton();
    UndoButton.putButton();
    RedoButton.putButton();
  }
}