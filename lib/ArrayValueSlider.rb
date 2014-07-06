class ArrayValueSlider
  def up!(arr)
    moved = slide_up!(arr)
    merge_up!(arr) if moved
    moved
  end

  def down!(arr)
    slide_down!(arr)
    merge_down!(arr)
  end

  def left!(arr)
    slide_left!(arr)
    merge_left!(arr) 
  end

  def right!(arr)
    slide_right!(arr)
    merge_right!(arr)
  end

  private

  def slide_up!(arr)
    board_moved = false
    (0..3).each { |x|
      (0..3).each { |y|
        if(arr[x][y] == 0)
          (x..3).each { |subx| 
            if(arr[subx][y] != 0) then
              arr[x][y] = arr[subx][y]
              arr[subx][y] = 0
              board_moved = true
              break
            end 
          }
        end
      }
    }  
    board_moved
  end

  def merge_up!(arr)
    (0..2).each { |x|
      (0..3).each { |y|
        if(arr[x][y] == arr[x+1][y]) then
          arr[x][y] += arr[x][y] 
          arr[x+1][y] = 0
        end
      }
    }

    slide_up!(arr)
  end

  def slide_left!(arr)
    (0..3).each { |x|
      3.downto(0).each { |y|
        if(arr[x][y] == 0) then
          3.downto(y).each { |suby|
            if(arr[x][suby] != 0) then
              arr[x][y] = arr[x][suby]
              arr[x][suby] = 0
              break
            end
          }
        end  
      }
    }     
  end

  def merge_left!(arr)
    (0..3).each { |x|
      (0..2).each { |y|
        if(arr[x][y] == arr[x][y+1]) then
          arr[x][y] += arr[x][y]
          arr[x][y+1] = 0
        end
      } 
    }

    slide_left!(arr)
  end

  def slide_right!(arr)
    (0..3).each{ |x|
      3.downto(0).each { |y| 
        if(arr[x][y] == 0) then
          y.downto(0).each { |suby|
            if(arr[x][suby] != 0) then
              arr[x][y] = arr[x][suby]
              arr[x][suby] = 0
              break
            end
          }
        end
      }
    }
  end

  def merge_right!(arr)
    (0..3).each { |x|
      3.downto(0).each { |y|
        if(arr[x][y] == arr[x][y-1]) then
          arr[x][y] += arr[x][y]
          arr[x][y-1] = 0
        end
      } 
    }    

    slide_right!(arr)
  end

  def slide_down!(arr)
    3.downto(0).each { |x|
      (0..3).each { |y|
        if(arr[x][y] == 0) then
          x.downto(0).each { |subx|
            if(arr[subx][y] != 0) then
              arr[x][y] = arr[subx][y]
              arr[subx][y] = 0
              break
            end
          }
        end  
      } 
    } 
  end

  def merge_down!(arr)
    3.downto(1) { |x|
      (0..3).each { |y|
        if(arr[x][y] == arr[x-1][y]) then
          arr[x][y] += arr[x][y]
          arr[x-1][y] = 0
        end
      }
    }

    slide_down!(arr)
  end
end
