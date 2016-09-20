require 'colorize'
require_relative './piece/bishop'
require_relative './piece/queen'
require_relative './piece/rook'

require_relative './piece/king'
require_relative './piece/knight'

require_relative './piece/pawn'

require_relative './piece/nullpiece'

class Board
  attr_reader :rows, :captured

  def initialize
    @captured = []
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
    if self[from_pos].is_a?(NullPiece)
      raise MoveError.new("ERROR! No piece to move at #{from_pos}!")
    end

    piece = self[from_pos]
    unless piece.moves.include?(to_pos)
      raise MoveError.new("ERROR! #{piece.symbol} to #{to_pos} is not a legal move!")
    end

    @captured << self[to_pos] if self[to_pos].is_a?(Piece)
    self[to_pos] = piece
    self[from_pos] = NullPiece.instance
  end

  def checkmate?
  end

  def in_bounds?(pos)
    pos.all? { |idx| (0...@rows.size).include?(idx) }
  end

  def find(target_piece)
    @rows.each_with_index do |row, x|
      row.each_with_index do |piece, y|
        return [x,y] if piece == target_piece
      end
    end

    nil
  end

  protected
  def make_starting_grid
    @rows = Array.new(8) { Array.new(8) { NullPiece.instance } }
    @rows[0] = non_pawn_line(:black)
    @rows[1] = Array.new(8) { Pawn.new(:black, self) }
    @rows[6] = Array.new(8) { Pawn.new(:white, self) }
    @rows[7] = non_pawn_line(:white)
  end

  def non_pawn_line(color)
    line = [Rook.new(color, self)]
    line << Knight.new(color, self) << Bishop.new(color, self) <<
        Queen.new(color, self) << King.new(color, self) <<
        Bishop.new(color, self) << Knight.new(color, self) <<
        Rook.new(color, self)
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
