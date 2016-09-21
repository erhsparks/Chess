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

  def initialize(rows = nil)
    @captured = []

    @rows = rows
    @rows ||= Array.new(8) { Array.new(8) { NullPiece.instance } }
  end

  def set_grid
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
    test_board = Board.new

    @rows.each_with_index do |row, x|
      row.each_with_index do |piece, y|
        next if piece.is_a?(NullPiece)

        color = piece.color
        test_board[[x,y]] = piece.class.new(color, test_board)
      end
    end

    test_board
  end

  def move_piece!(from_pos, to_pos)
    piece = self[from_pos]

    @captured << self[to_pos] if self[to_pos].is_a?(Piece)

    self[to_pos] = piece
    self[from_pos] = NullPiece.instance
  end

  def in_check?(color)
    king_pos = find_king(color)
    opponent_color = (color == :white ? :black : :white)
    @rows.any? do |row|
      row.any? do |piece|
        next if piece.is_a?(NullPiece)
        piece.moves.include?(king_pos) if piece.color == opponent_color
      end
    end
  end

  def checkmate?(color)
    @rows.each do |row|
      row.each do |piece|
        next if piece.is_a?(NullPiece) || piece.color != color

        piece.moves.each do |move|
          return false unless move_to_check?(piece.position, move)
        end
      end
    end

    true
  end

  def move_to_check?(from_pos, to_pos)
    test_board = self.dup
    test_piece = test_board[from_pos]
    test_board[to_pos] = test_piece
    test_board[from_pos] = NullPiece.instance

    in_check?(test_piece.color)
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

  def self.chessboard
    board = Board.new

    board.rows[0] = board.non_pawn_line(:black)
    board.rows[1] = Array.new(8) { Pawn.new(:black, board) }
    board.rows[6] = Array.new(8) { Pawn.new(:white, board) }
    board.rows[7] = board.non_pawn_line(:white)

    board
  end

  def non_pawn_line(color)
    line = [Rook.new(color, self)]
    line << Knight.new(color, self) << Bishop.new(color, self) <<
        Queen.new(color, self) << King.new(color, self) <<
        Bishop.new(color, self) << Knight.new(color, self) <<
        Rook.new(color, self)
  end

  def find_king(color)
    @rows.each_with_index do |row, x|
      row.each_with_index do |piece, y|
        next if piece.is_a?(NullPiece)
        return [x, y] if piece.color == color && piece.class == King
      end
    end
  end
end

class MoveError < StandardError
  attr_reader :message

  def initialize(message)
    @message = message.red
  end
end
