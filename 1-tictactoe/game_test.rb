gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'tictactoe'

class TictactoeTest < Minitest::Test

  def setup
    @tictactoe = Tictactoe.new
    @clean_board = @tictactoe.send(:new_board)
  end

  def test_new_board
    assert_equal [" "," "," "," "," "," "," "," "," "], @tictactoe.send(:new_board)
  end

  def test_user_X_win
    board = ["X","X","X",
             "O"," ","O",
             " "," "," "]
    assert @tictactoe.send(:check_winer, board, "X")
  end

  def test_user_X_lose
    board = ["X","O","X",
             "O","O","O",
             "O","X"," "]
    refute @tictactoe.send(:check_winer, board, "X")
  end

  def test_wrond_address
    refute @tictactoe.send(:check_position, "a4", @clean_board)
  end

  def test_valid_address
    assert @tictactoe.send(:check_position, "a1", @clean_board)
  end

  def test_duplicated_address
    board = ["X"," "," "," "," "," "," "," "," "]
    refute @tictactoe.send(:check_position, "a1", board)
  end

  def test_board_full
    board = ["X","O","X",
             "X","X","O",
             "O","X","O"]
    assert @tictactoe.send(:board_full?, board)
  end

  def test_board_not_full
    board = ["X","O","X",
             "X","X","O",
             "O"," ","O"]
    refute @tictactoe.send(:board_full?, board)
  end

end

