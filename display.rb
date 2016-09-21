require_relative 'board'
require_relative 'cursor'

class Display
  attr_reader :board, :cursor

  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def render
    system("clear")
    @board.rows.each_with_index do |row, x|
      row.each_with_index do |piece, y|
        color = display_color(x, y)
        print "#{piece.to_s} ".send(color)
      end
    print "\n"
    end
    puts
  end

  def display_color(x, y)
    color = "on_"
    color << "light_" if @cursor.cursor_pos == [x, y]

    if x.even?
      color << (y.even? ? "blue" :  "red")
    else
      color << (y.even? ? "red" : "blue")
    end

    color
  end
end
