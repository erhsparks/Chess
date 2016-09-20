require_relative 'piece'

class Pawn < Piece
  def initialize(color, board)
    @symbol = :♟
    super
  end

  def moves
    find_self
    valid_moves
  end

  protected
  def valid_moves
    valid_step_moves + valid_capture_moves
  end

  def valid_step_moves
    result = []

    step_diffs.each_with_index do |diff, idx|
      test_pos = get_test_pos(diff)

      return result unless board.in_bounds?(test_pos)
      if board[test_pos].is_a?(Piece)
        break
      else
        next if idx == 1 && !at_start_row?
        result << test_pos
      end
    end

    result
  end

  def valid_capture_moves
    result = []
    capture_diffs.each do |diff|
      test_pos = get_test_pos(diff)

      return result unless board.in_bounds?(test_pos)
      if board[test_pos].is_a?(Piece)
        board[test_pos].color == @color ? next : (result << test_pos)
      end
    end

    result
  end

  def at_start_row?
    @color == :white ? (@my_position[0] == 6) : (@my_position[0] == 1)
  end

  def get_test_pos(diff)
    x, y = @my_position
    dx, dy = diff

    [x + dx, y + dy]
  end

  def step_diffs
    @color == :white ? [[-1,0], [-2,0]] : [[1,0], [2,0]]
  end

  def capture_diffs
    @color == :white ? [[-1,-1], [-1,1]] : [[1,-1], [1,1]]
  end
end
