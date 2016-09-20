require_relative 'piece'

module Slideable
  def moves
    find_self
    valid_moves
  end

  private
  def valid_moves
    result = []
    self.move_diffs.each do |diff|
      result += grow_unblocked_moves_in_dir(@my_position, diff)
    end

    result
  end

  def grow_unblocked_moves_in_dir(pos, diff)
    x, y = pos
    dx, dy = diff
    test_pos = [x + dx, y + dy]

    return [] unless board.in_bounds?(test_pos)
    if board[test_pos].is_a?(Piece)
      board[test_pos].color == @color ? [] : [test_pos]
    else
      [test_pos].concat(grow_unblocked_moves_in_diff(test_pos, diff))
    end
  end
end
