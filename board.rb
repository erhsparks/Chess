require 'colorize'

class NullPiece

  attr_reader :symbol

  def initialize
    @symbol = :♘
    #placeholder
  end

  def to_s
    @symbol.to_s.white
  end

  def valid_moves
    [[0,0],[2,2]]
  end
end

class Board
  attr_reader :rows

  def initialize
    make_starting_grid
  end

  def [](pos)
    x,y = pos

    @rows[x][y]
  end

  def []=(pos, piece)
    x,y = pos

    @rows[x][y] = piece
  end

  def dup
  end

  def move_piece(color, from_pos, to_pos)
  end

  def move_piece!(from_pos, to_pos)
    if self[from_pos] == NullPiece.new
      raise MoveError.new("ERROR! No piece to move at #{from_pos}!")
    end

    piece = self[from_pos]
    unless piece.valid_moves.include?(to_pos)
      raise MoveError.new("ERROR! #{piece.symbol} to #{to_pos} is not a legal move!")
    end

    #if capturing, need logic here
    self[to_pos] = piece
    self[from_pos] = NullPiece.new
  end

  def checkmate?
  end

  def in_bounds?(pos)
    pos.all? { |idx| (0...@rows.size).include?(idx) }
  end

  protected

  def make_starting_grid
    @rows = Array.new(8) { Array.new(8) { NullPiece.new } }
  end

  def find_king(color)
  end
end

class MoveError < StandardError
  attr_reader :message

  def initialize(message)
    @message = message.red
  end

end
