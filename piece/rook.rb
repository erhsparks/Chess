require_relative 'slideable'

class Rook < Piece
  include Slideable

  def initialize(color, board)
    @symbol = :♜
    super
  end

  protected
  def move_diffs
    [[-1,0], [1,0], [0,-1], [0,1]]
  end
end
