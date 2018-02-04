class Game
  def initialize(rows, cols)
    @board = Array.new(rows) { Array.new(cols, 0) }
    @to_live = []
    @to_die = []
  end

  def live_field(fields)
    fields.each { |field| @board[field[:x]][field[:y]] = 1 }
  end

  def dead_field(fields)
    fields.each { |field| @board[field[:x]][field[:y]] = 0 }
  end

  def print
    @board.each { |row| p row }
    puts "---------------"
  end

  def check_field(field)
    x = field[:x]
    y = field[:y]
    field_type = @board[field[:x]][field[:y]]

    options = [[x-1, y-1], [x-1, y], [x-1, y+1], [x, y-1],
      [x, y+1], [x+1, y-1], [x+1, y], [x+1, y+1]]

    valid_opitions = options.select do |opt|
      opt.all? { |el| el >= 0 && el < @board.size }
    end

    neighbours = []
    valid_opitions.each { |opt| neighbours << @board[opt[0]][opt[1]] }

    positive = neighbours.count{ |el| el == 1 }

    if field_type == 0 && positive == 3
      @to_live << {x: x, y: y}
    elsif field_type == 1 && (positive < 2 || positive > 3)
      @to_die << {x: x, y: y }
    end

  end

  def update_board
    @board.each_with_index do |row, row_index|
      row.each_with_index { |field, field_index| check_field({ x: row_index, y: field_index }) }
    end
    live_field(@to_live)
    @to_live.clear
    dead_field(@to_die)
    @to_die.clear
  end
end

# game = Game.new(10,10)
# game.print

# # glider
# game.live_field([{x:2,y:0},{x:2,y:1},{x:2,y:2},{x:1,y:2},{x:0,y:1}])

# game.print
# game.update_board
# game.print
# game.update_board
# game.print
# game.update_board
# game.print
# game.update_board
# game.print
# game.update_board
# game.print
