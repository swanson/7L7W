class TicTacToe(squares: List[String]) {
  //squares
  // 0 1 2
  // 3 4 5
  // 6 7 8
  var winner = ""

  checkForWinners()

  def result(): String = {
    if (winner == "X") {
      return "X has won the game!"
    } else if (winner == "O") {
      return "O has won the game!"
    } else if (anyMovesLeft()) {
      return "The game is not over yet!"
    } else {
      return "The game is a tie."
    }
  }

  private def anyMovesLeft(): Boolean = {
    squares.exists( s => s == "")
  }

  private def checkForWinners(): Boolean = {
    //rows
    isWinner(squares(0), squares(1), squares(2)) ||
    isWinner(squares(3), squares(4), squares(5)) ||
    isWinner(squares(6), squares(7), squares(8)) ||
    //columns
    isWinner(squares(0), squares(3), squares(6)) ||
    isWinner(squares(1), squares(4), squares(7)) ||
    isWinner(squares(2), squares(5), squares(8)) ||
    //diagonals
    isWinner(squares(0), squares(4), squares(8)) ||
    isWinner(squares(2), squares(4), squares(6))
  }

  private def isWinner(one: String, two: String, three: String) 
    : Boolean = {
      val all_xs = ("X", "X", "X")
      val all_os = ("O", "O", "O")
      val move = (one, two, three)

      if (move == all_xs) {
        winner = "X"
        return true
      }

      if (move == all_os) {
        winner = "O"
        return true
      }

      return false
  }
}

val empty_board = List("", "", "", "", "", "", "", "", "")
println("Empty: " + new TicTacToe(empty_board).result)

val one_move_board = List("", "", "", "", "X", "", "", "", "")
println("One move: " + new TicTacToe(one_move_board).result)

val x_board = List("O", "X", "O", "", "X", "", "", "X", "")
println("X wins: " + new TicTacToe(x_board).result)

val o_board = List("O", "X", "O", "X", "O", "", "X", "", "O")
println("O wins: " + new TicTacToe(o_board).result)

val tie_board = List("O", "X", "O", "X", "O", "X", "X", "O", "X")
println("Tie: " + new TicTacToe(tie_board).result)