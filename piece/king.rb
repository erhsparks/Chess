require_relative 'steppable'

class King < Piece
  include Steppable

  def initialize(color, board)
    @symbol = :♚
    super
  end

  protected
  def move_diffs
  end

end
