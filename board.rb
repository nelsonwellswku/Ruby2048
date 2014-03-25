class Board
  Tuple = Struct.new(:x, :y)

  def initialize
    @rand = Random.new
    @board = Array.new
    (0..3).each { |x|
      @board[x] = Array.new
      (0..3).each { |y| 
        @board[x][y] = 0 
      }
    } 

    fill_random_index
    fill_random_index
  end

  def draw
    (0..3).each { |x| 
      puts "\n"
      (0..3).each { |y| 
        print "\t", @board[x][y], "\t"
      }
      puts "\n\n"
    }
  end 

  private

  def random_open_index
    (0..3).to_a.shuffle.each { |x|
      (0..3).to_a.shuffle.each { |y|
        if(@board[x][y] == 0) then
          tuple = Tuple.new
          tuple.x = x
          tuple.y = y
          return tuple
        end 
      }
    } 
    
    nil
  end

  def fill_random_index 
    tuple = random_open_index
    @board[tuple.x][tuple.y] = 2
  end
end
