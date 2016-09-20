require_relative 'piece'

module SteppingPiece

end

class Knight < Piece
  def initialize(color, board)
    @symbol = :♞
    super
  end

end

class King < Piece
  def initialize(color, board)
    @symbol = :♚
    super
  end

end
