class Game

  def play
    # Game instructions
    puts "Welcome Players in the TicTacToe game!
    To hit desired position just type cell address as shown bellow."
    positions = %w(A1 A2 A3 B1 B2 B3 C1 C2 C3)
    print_board(positions)

    # Start game
    puts "Lets play!"
    current_player = "X"
    hits = new_board
    until check_winer(hits, current_player) do
      current_player == "X" ? current_player = "O" : current_player = "X"
      print "Player #{current_player} turn. Type cell address: "
      address = gets
      update_hits(address, hits, current_player)
      print_board(hits)
    end
    puts "Game won by: Player #{current_player}"
  end

  private

  def new_board
    Array.new(9, " ")
  end

  def print_board(hits)
    puts "    -------------
    | #{hits[0]} | #{hits[1]} | #{hits[2]} |
    -------------
    | #{hits[3]} | #{hits[4]} | #{hits[5]} |
    -------------
    | #{hits[6]} | #{hits[7]} | #{hits[8]} |
    -------------"
  end

  def update_hits(position, board, player)
    position.delete!("\n").capitalize!
    case position
      when "A1"; board[0] = player
      when "A2"; board[1] = player
      when "A3"; board[2] = player
      when "B1"; board[3] = player
      when "B2"; board[4] = player
      when "B3"; board[5] = player
      when "C1"; board[6] = player
      when "C2"; board[7] = player
      when "C3"; board[8] = player
      else puts "You gave wrong address"
    end
  end

  def check_winer(board, player)
    win_options = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6],
                    [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]
    player_hits = board.each_index.select{|i| board[i] == player}
    result = win_options.include?(player_hits)? true : false
  end

end

game = Game.new
game.play
