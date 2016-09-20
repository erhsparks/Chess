require 'colorize'

class Piece
  attr_reader :color, :symbol, :my_position, :board

    def initialize(color, board)
      @color = color
      @board = board
    end

    def find_self
      @my_position = board.find(self)
    end

    def to_s
      sym = @symbol.to_s
      color = @color.to_s

      sym.send(color)
    end
end
