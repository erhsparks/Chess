require_relative 'slideable'

class Bishop < Piece
  include Slideable
  # attrs include @board, @my_positon, @color

  def initialize(color, board)
    @symbol = :♝
    super
  end

  protected
  def move_dirs

  end
end
