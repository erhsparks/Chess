require_relative 'slideable'

class Rook < Piece
  include Slideable

  def initialize(color, board)
    @symbol = :♜
    super
  end

  protected
  def move_dirs

  end
end
