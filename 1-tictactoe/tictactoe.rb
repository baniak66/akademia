class Tictactoe

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
      address = gets.chomp
      valid_shot = check_position(address, hits)
      until valid_shot do
        print "You gave wrong address, try one more time: "
        address = gets.chomp
        valid_shot = check_position(address, hits)
      end
      update_hits(valid_shot, hits, current_player)
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
    board[position] = player
  end

  def check_position(address, board)
    address.capitalize!
    case address
      when "A1"; position = 0
      when "A2"; position = 1
      when "A3"; position = 2
      when "B1"; position = 3
      when "B2"; position = 4
      when "B3"; position = 5
      when "C1"; position = 6
      when "C2"; position = 7
      when "C3"; position = 8
      else false
    end
    if position and board[position] == " "
      position
    else
      false
    end
  end

  def check_winer(board, player)
    win_options = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6],
                    [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]
    player_hits = board.each_index.select{|i| board[i] == player}
    result = win_options.include?(player_hits)? true : false
  end

end


