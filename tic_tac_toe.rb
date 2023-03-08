class Player
  attr_reader :name, :marker, :marks

  def initialize(name, marker)
    @name = name
    @marker = marker
    @marks = []
  end
end

class Game
  LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]].freeze

  def initialize
    @player1 = Player.new('Player 1', 'X')
    @player2 = Player.new('Player 2', 'O')
    puts "Marker for #{@player1.name} is [#{@player1.marker}]"
    puts "Marker for #{@player2.name} is [#{@player2.marker}]"
    @current_player = @player1
    @board = create_board
    @playing = true
  end

  def create_board
    Array.new(3) { |i| Array.new(3) { |j| (j + 1) + (3 * i) } }
  end

  def start
    draw_board
    play
  end

  def play
    while empty_spaces? && @playing
      puts "\n#{@current_player.name} please choose where to put your mark"
      mark = gets.chomp.to_i
      assign_mark(mark)
      draw_board
      checking_winning_position
      change_player
    end
    puts "\nIt's a tie" if @playing
  end

  def change_player
    @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
  end

  def checking_winning_position
    @playing = LINES.none? do |line|
      line.all? { |num| @current_player.marks.include?(num) }
    end
    puts "\n#{@current_player.name} won!" unless @playing
  end

  def assign_mark(mark)
    @board.each do |row|
      if row.any? { |elem| elem == mark }
        @current_player.marks.push(mark)
        return row[row.index(mark)] = @current_player.marker
      end
    end
    puts 'Please choose numbered space:'
    assign_mark(gets.chomp.to_i)
  end

  def empty_spaces?
    @board.any? do |row|
      row.any? { |elem| elem.instance_of?(Integer) }
    end
  end

  def draw_board
    puts "\nCurrent board:"
    13.times { print '-' }
    print "\n"
    @board.each do |elem|
      puts "| #{elem[0]} | #{elem[1]} | #{elem[2]} |"
      13.times { print '-' }
      print "\n"
    end
  end
end

new_game = Game.new
new_game.start
