require_relative 'display'
require_relative 'player'

class Chess
  attr_reader :current_player

  def initialize(player1 = nil, player2 = nil, board = Board.chessboard)
    @board = board
    @display = Display.new(@board)

    @player1 = player1
    @player2 = player2

    @player1 ||= HumanPlayer.new("Player1", :white, @display)
    @player2 ||= HumanPlayer.new("Player2", :black, @display)

    @current_player = (@player1.color == :white ? @player1 : @player2)
  end

  def play
    play_turn until game_over?
    @display.render

    announce_result
  end

  def game_over?
    @board.checkmate?(@player1.color) || @board.checkmate?(@player2.color)
  end

  def announce_result
    if @board.checkmate?(@player1.color)
      puts "Checkmate! #{@player2.name} wins!"
    elsif @board.checkmate?(@player2.color)
      puts "Checkmate! #{@player1.name} wins!"
    else
      puts "Draw! Rematch?"
    end
  end

  def play_turn
    @current_player.play_turn

    @current_player = (@current_player == @player2 ? @player1 : @player2)
  end
end


if __FILE__ == $PROGRAM_NAME
  g = Chess.new
  g.play
end
