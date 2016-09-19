require_relative 'board'
require_relative 'cursor'

class Display

  def initialize(board = Board.new)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def render
# require 'byebug'
# debugger
    @board.rows.each_with_index do |row, i|
      row.each_with_index do |piece, j|
        if @cursor.cursor_pos == [i, j]
          print "| #{piece.to_s} |".on_blue
        else
          print "| #{piece.to_s} |"
        end
      end
    print "\n"
    end
    puts
  end

  # def test_cursor
  #   while true
  #     render
  #     @cursor.get_input
  #   end
  # end
end


if __FILE__ == $PROGRAM_NAME
  d = Display.new
  d.test_cursor
end
