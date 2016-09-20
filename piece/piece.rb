require_relative '../board'
require_relative 'nullpiece'
require_relative 'sliding_piece'
require_relative 'stepping_piece'

class Piece
  attr_reader :color, :symbol

    def initialize(color, symbol, board)
      @color = color
      @symbol = symbol
      @board = board
    end

    def to_s
      @symbol.send(@color)
    end
end
