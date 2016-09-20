require_relative 'piece'

module Steppable
  def moves
    find_self
    valid_moves
  end

  private
  def valid_moves
    result = []
    x, y = @my_position

    self.move_diffs.each do |dir|
      dx, dy = dir
      test_pos = [x + dx, y + dy]

      next unless board.in_bounds?(test_pos)
      if board[test_pos].is_a?(Piece)
        board[test_pos].color == @color ? next : (result << test_pos)
      else
        result << test_pos
      end
    end

    result
  end
end
