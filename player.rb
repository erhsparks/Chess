require_relative 'display'

class HumanPlayer
  attr_reader :color, :name

  def initialize(name, color, display)
    @name = name
    @color = color
    @display = display
  end

  def play_turn
    @display.board.move_piece!(*get_valid_move)
  end

  def player_input
    @display.render

    pos = nil
    while pos.nil?
      @display.render

      pos = @display.cursor.get_input
    end

    pos
  end

  def get_valid_move
    from_pos = player_input

    board = @display.board
    if board[from_pos].is_a?(NullPiece)
      raise MoveError.new("ERROR! No piece to move at #{from_pos}!")
    end

    unless board[from_pos].color == @color
      raise MoveError.new("ERROR! You're not allowed to move the other player's pieces!")
    end

    to_pos = player_input

    piece = board[from_pos]
    unless piece.moves.include?(to_pos)
      raise MoveError.new("ERROR! #{piece.symbol} to #{to_pos} is not a legal move!")
    end

    if board.move_to_check?(from_pos, to_pos)
      raise MoveError.new("ERROR! Cannot move into check!")
    end

    [from_pos, to_pos]
    
    rescue MoveError => e
      puts e.message
      sleep(2)
      retry
  end
end
