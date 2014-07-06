class RandomComputerTurn

  def make_move!(board)
    tuple = random_open_index(board.board)
    # TODO: This should choose between 2 and 4
    # 2 = 90% of the time
    # 4 = 10% of the time
    board.board[tuple.x][tuple.y] = 2 
  end

  private

  Tuple = Struct.new(:x, :y)

  def random_open_index(board_arr)
    (0..3).to_a.shuffle.each { |x|
      (0..3).to_a.shuffle.each { |y|
        if(board_arr[x][y] == 0) then
          tuple = Tuple.new
          tuple.x = x
          tuple.y = y
          return tuple
        end
      }
    }
  
    nil
  end

end
