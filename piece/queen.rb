require_relative 'slideable'

class Queen < Piece
  include Slideable

  def initialize(color, board)
    @symbol = :♛
    super
  end

  protected
  def move_dirs

  end
end
