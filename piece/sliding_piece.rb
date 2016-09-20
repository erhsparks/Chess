require_relative 'piece'

module Slideable
  def valid_moves(from_pos, to_pos)
    self.move_dirs is assumed to exist
  end
end

class Bishop < Piece
  include Slideable

  def initialize(color, board)
    @symbol = :♝
    super
  end

  def move_dirs
    []
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
