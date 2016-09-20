require_relative 'steppable'

class King < Piece
  include Steppable

  def initialize(color, board)
    @symbol = :♚
    super
  end

  protected
  def move_diffs
    [[-1,-1], [-1,1], [1,-1], [1,1], [-1,0], [1,0], [0,-1], [0,1]]
  end
end
