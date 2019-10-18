class Trout {
  int x, y, troutWidth, troutHeight;
  int zone;
  //Piece piece;
  boolean onPiece;

  Trout(int x, int y, int troutWidth, int troutHeight, int zone) {
    this.x = x;
    this.y = y;
    this.troutWidth = troutWidth;
    this.troutHeight = troutHeight;
    this.zone = zone;
    onPiece = false;
  }

  void showUp() {
    if (onMouse()) fill(#ff0000, 100);
    else noFill();
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

  void setPiece(){
    onPiece = true;
  }
  //void setPiece(Piece piece) {

   //this.piece = piece;
  //}

  int getX() {
    return x;
  }

  int getY() {
    return y;
  }
}