require_relative "./BoardRenderer"
require_relative "./Board"

class GameManager
  def run
    board = Board.new
    board_renderer = BoardRenderer.new(board)

    until board.game_over? do
      board_renderer.draw
      puts "Next turn?"
      turn = gets
      puts turn
      turn = turn.chomp
      case turn
      when "u"
        board.slide_up!
      when "d"
        board.slide_down!
      when "l"
        board.slide_left!
      when "r"
        board.slide_right!
      else
        puts "Invalid input. Move up, down, left, or right."
      end
    end  
  end
end
