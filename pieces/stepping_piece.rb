require_relative 'piece'

module SteppingPiece

end

class Knight < Piece
  def initialize
    @symbol = :♞
  end

end

class King < Piece
  def initialize
    @symbol = :♚
  end

end
