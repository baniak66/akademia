require 'bundler'

Bundler.require(:default)

require 'sinatra'
require 'sinatra/reloader'
require 'haml'
require './game.rb'

before do
  # set size of board
  rows = 10
  cols = 10
  @board = Array.new(rows) { Array.new(cols, "dead") }
end

get '/' do
  haml :start
end

post '/set' do
  @board_state = params
  haml :board
end

post '/update' do
  to_live = []
  to_die = []

  params.delete('captures')
  params.each do |field|
    x = field.first[0,1].to_i
    y = field.first[1,1].to_i
    field_type = field.last

    options = [[x-1, y-1], [x-1, y], [x-1, y+1], [x, y-1],
      [x, y+1], [x+1, y-1], [x+1, y], [x+1, y+1]]

    valid_opitions = options.select do |opt|
      opt.all? { |el| el >= 0 && el < 10 }
    end
    neighbours = []
    valid_opitions.each { |opt| neighbours << params["#{opt[0]}#{opt[1]}"] }
    positive = neighbours.count{ |el| el == "live" }

    if field_type == "dead" && positive == 3
      to_live << "#{x}#{y}"
    elsif field_type == "live" && (positive < 2 || positive > 3)
      to_die << "#{x}#{y}"
    end
  end

  to_live.each { |el| params[el] = "live" }
  to_live.clear
  to_die.each { |el| params[el] = "dead" }
  to_die.clear

  @board_state = params
  haml :board
end
