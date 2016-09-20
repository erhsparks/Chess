require_relative 'piece'

module Slideable
  def moves
    valid_moves
  end

  private
  def valid_moves
    result = []
    self.move_dirs.each do |dir|
      result += grow_unblocked_moves_in_dir(@my_position, dir)
    end

    result
  end

  def grow_unblocked_moves_in_dir(pos, dir)
    x, y = pos
    dx, dy = dir
    test_pos = [x + dx, y + dy]

    return [] if board.in_bounds?(test_pos)
    if board[test_pos] != NullPiece.instance
      board[test_pos].color == @color ? [] : [test_pos]
    else
      [test_pos].concat([grow_unblocked_moves_in_dir(test_pos, dir)])
    end
  end

end
