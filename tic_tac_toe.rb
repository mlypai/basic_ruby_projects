# frozen_string_literal: true

# creates player for a game #
class Player
  attr_reader :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
    puts "#{@name}, your marker is [#{@marker}]"
  end
end

# executes all steps necessary for a game #
class Game
  def initialize
    puts 'Enter first player name: '
    @player1 = Player.new(gets.chomp, 'X')
    puts 'Enter second playersname: '
    @player2 = Player.new(gets.chomp, 'O')
    @board = Array.new(3) { |i| Array.new(3) { |j| (j + 1) + (3 * i) } }
  end

  def start
    drawing_board(@board)
  end

  def drawing_board(board)
    13.times { print '-' }
    print "\n"
    board.each do |elem|
      puts "| #{elem[0]} | #{elem[1]} | #{elem[2]} |"
      13.times { print '-' }
      print "\n"
    end
  end
end

new_game = Game.new
new_game.start()