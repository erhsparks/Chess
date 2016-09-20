require_relative 'slideable'

class Bishop < Piece
  include Slideable

  def initialize(color, board)
    @symbol = :♝
    super
  end

  protected
  def move_dirs
    [[-1,-1], [-1,1], [1,-1], [1,1]]
  end
end
