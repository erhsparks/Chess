require_relative 'piece'

class Pawn < Piece
  def initialize(color, board)
    @symbol = :♟
    super
  end

end
