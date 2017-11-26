gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'tictactoe'

class TictactoeTest < Minitest::Test
  def test_new_board
    tictactoe = Tictactoe.new
    assert_equal [" "," "," "," "," "," "," "," "," "], tictactoe.send(:new_board)
  end

  def test_user_X_win
    tictactoe = Tictactoe.new
    board1 = ["X","X","X","O"," ","O"," "," "," "]
    assert tictactoe.send(:check_winer, board1, "X")
  end

  def test_user_X_lose
    tictactoe = Tictactoe.new
    board2 = ["X","O","X","O","X","O","O","X","O"]
    refute tictactoe.send(:check_winer, board2, "X")
  end
end

