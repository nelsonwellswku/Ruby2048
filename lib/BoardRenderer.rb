class BoardRenderer
  def initialize(board)
    @board = board
  end

  def draw
    (0..3).each { |x|
      puts "\n"
      (0..3).each { |y|
        print "\t", @board.board[x][y], "\t"
      }
      puts "\n\n"
    }
  end
end
