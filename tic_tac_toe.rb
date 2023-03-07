class Player
  attr_reader :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
    puts "#{@name}, your marker is [#{@marker}]"
  end
end

class Game
  def initialize
    puts 'Enter first player name: '
    @player1 = Player.new(gets.chomp, 'X')
    puts 'Enter second playersname: '
    @player2 = Player.new(gets.chomp, 'O')
  end
end

Game.new