require_relative 'piece'

module SlidingPiece

end

class Bishop < Piece
  def initialize
    @symbol = :♝
  end

end

class Rook < Piece
  def initialize
    @symbol = :♜
  end

end

class Queen < Piece
  def initialize
    @symbol = :♛
  end

end
