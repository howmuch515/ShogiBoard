class Trout {
  int x, y, troutWidth, troutHeight;
  boolean onPiece;
  int zone;
  Piece piece;

  Trout(int x, int y, int troutWidth, int troutHeight, int zone) {
    this.x = x;
    this.y = y;
    this.troutWidth = troutWidth;
    this.troutHeight = troutHeight;
    this.zone = zone;
    //onPiece = false;
  }

  void showUp() {
    if (onMouse()) fill(#ff0000, 100);
    else noFill(); 
    //if(zone == 0) fill(#ff0000);
    //else if(zone == 1) fill(#00ff00);
    //else if(zone == -1) fill(#0000ff);
    rectMode(CORNER);
    rect(x, y, troutWidth, troutHeight);
  }

  boolean onMouse() {
    //return x <= mouseX && mouseX < x+troutWidth && y <= mouseY && mouseY < y+troutHeight;
    if (menu.TurningSwitch.IO) {
      if (playerS.turn) return x <= mouseX && mouseX < x+troutWidth && y <= mouseY && mouseY < y+troutHeight;
      else {
        int X = width - mouseX;
        int Y = height - mouseY;
        return x <= X && X < x+troutWidth && y <= Y && Y < y+troutHeight;
      }
    } else {
      return x <= mouseX && mouseX < x+troutWidth && y <= mouseY && mouseY < y+troutHeight;
    }
  }

  void setPiece(Piece piece) {
   this.piece = piece;
  }

  int getX() {
    return x;
  }

  int getY() {
    return y;
  }
}