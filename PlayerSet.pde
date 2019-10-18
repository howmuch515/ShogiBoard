class PlayerSet {
  //FIRST => turn = true, LAST => turn = false.
  boolean turn;
  Player SPlayer;
  Player GPlayer;

  //Constructer
  PlayerSet () {
    turn = true;
    SPlayer = new Player("SENTE", true, pieceTableA);
    GPlayer = new Player("GOTE" , false, pieceTableB);
  }

  //Player Class define.
  class Player {
    String name;
    boolean playerTurn;
    boolean winner;
    PieceTable pieceTable;
    Timer timer;
    Player(String name, boolean playerTurn, PieceTable pieceTable) {
      this.name = name;
      this.playerTurn = playerTurn;
      this.timer = new Timer(200, 200, playerTurn, 0, 3, 0);
      this.pieceTable = pieceTable;
    }
  }

  //Timer
  class Timer {
    int px, py;
    boolean playerTurn;
    int hour;
    int minutes;
    int seconds;
    float timer;

    Timer(int px, int py, boolean playerTurn, int hour, int minutes, int seconds) {
      this.playerTurn = playerTurn;
      this.px = playerTurn ? px : width - px;
      this.py = playerTurn ? py : height - py;
      this.hour = hour;
      this.minutes = minutes;
      this.seconds = seconds;
      this.timer = hour * 60 * 60 + minutes * 60 + seconds;
    }

    void run() {
      timer -= 1.0 /FRAME;
    }

    void reset() {
      timer = hour * 60 * 60 + minutes * 60 + seconds;
    }

    void showUp() {
      textSize(30);
      textAlign(CENTER);
      fill(#000000);
        //int h = (int) timer/(60*60);
        int lastTime = (int) timer;
         int m = lastTime / 60;
         int s = lastTime % 60;

        String timerDisplay =  m + "m" + s + "s";
        if(playerTurn) text(timerDisplay, width-100, height-100);
        else text(timerDisplay, 100, 100);
    }
  }

  void showUp() {
    //if(turn) SPlayer.timer.run();
    //else GPlayer.timer.run();
    //SPlayer.timer.showUp();
    //GPlayer.timer.showUp();
  }
  void turnChange() {
    this.turn = !this.turn;
  }

  String turnPlayerName() {
    return turn ? SPlayer.name : GPlayer.name;
  }

   //Resignation function
   void resign() {
      if(turn) {
        SPlayer.winner = false;
        GPlayer.winner = true;
      } else {
        SPlayer.winner = true;
        GPlayer.winner = false;
      }
      gameOver();
    }

  //GAME RESET
  void reset() {
    this.turn = true;
  }

  //returnning winner name
  String getWinnerName() {
    return SPlayer.winner  ? SPlayer.name : GPlayer.name;
  }
}