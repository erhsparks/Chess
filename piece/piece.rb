require 'colorize'

class Piece
  attr_reader :color, :symbol

    def initialize(color, board)
      @color = color
      @board = board
      @my_positon = board.find(self)
    end

    def to_s
      sym = @symbol.to_s
      color = @color.to_s

      sym.send(color)
    end
end
