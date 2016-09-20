require_relative 'piece'

module SlidingPiece

end

class Bishop < Piece
  def initialize(color, board)
    @symbol = :♝
    super
  end

end

class Rook < Piece
  def initialize(color, board)
    @symbol = :♜
    super
  end

end

class Queen < Piece
  def initialize(color, board)
    @symbol = :♛
    super
  end

end
