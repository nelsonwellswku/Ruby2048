require_relative "./ArrayValueSlider"
require_relative "./RandomComputerTurn"

class Board

  attr_reader :board

  def initialize(slider = nil, computer_turn = nil)
    @board = Array.new
    @slider = slider || ArrayValueSlider.new
    @computer_turn = computer_turn || RandomComputerTurn.new

    (0..3).each { |x|
      @board[x] = Array.new
      (0..3).each { |y| 
        @board[x][y] = 0 
      }
    } 

    @board[1][0] = 2 
    @board[1][1] = 2
  end

  def slide_up!
    moved = @slider.up!(@board)

    # TODO: This needs a unit test
    @computer_turn.make_move!(self) if moved
  end

  def slide_down!
    moved = @slider.down!(@board)

    # TODO: This needs a unit test
    @computer_turn.make_move!(self) if moved
  end

  def slide_left!
    moved = @slider.left!(@board)

    # TODO: This needs a unit test
    @computer_turn.make_move!(self) if moved
  end

  def slide_right!
    moved = @slider.right!(@board)

    # TODO: This needs a unit test
    @computer_turn.make_move!(self) if moved
  end

  def game_over?
    (0..3).each { |x|
      (0..3).each { |y| 
        return false if @board[x][y] == 0  
      }
    }

    true
  end

end
