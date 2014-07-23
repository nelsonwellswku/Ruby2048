class ArrayValueSlider
  def up!(arr)
    moved = slide_up!(arr)
    merged = merge_up!(arr)
    moved || merged
  end

  def down!(arr)
    moved = slide_down!(arr)
    merged = merge_down!(arr)
    moved || merged
  end

  def left!(arr)
    moved = slide_left!(arr)
    merged = merge_left!(arr) 
    moved || merged
  end

  def right!(arr)
    moved = slide_right!(arr)
    merged = merge_right!(arr)
    moved || merged
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
    merged = false
    (0..2).each { |x|
      (0..3).each { |y|
        if(arr[x][y] == arr[x+1][y]) then
          arr[x][y] += arr[x][y] 
          arr[x+1][y] = 0
          merged = true unless arr[x][y] == 0
        end
      }
    }

    slide_up!(arr)
    merged
  end

  def slide_left!(arr)
    board_moved = false
    (0..3).each { |x|
      3.downto(0).each { |y|
        if(arr[x][y] == 0) then
          3.downto(y).each { |suby|
            if(arr[x][suby] != 0) then
              arr[x][y] = arr[x][suby]
              arr[x][suby] = 0
              board_moved = true
              break
            end
          }
        end  
      }
    }
    board_moved
  end

  def merge_left!(arr)
    merged = false
    (0..3).each { |x|
      (0..2).each { |y|
        if(arr[x][y] == arr[x][y+1]) then
          arr[x][y] += arr[x][y]
          arr[x][y+1] = 0
          merged = true unless arr[x][y] == 0
        end
      } 
    }

    slide_left!(arr)
    merged
  end

  def slide_right!(arr)
    board_moved = false
    (0..3).each{ |x|
      3.downto(0).each { |y| 
        if(arr[x][y] == 0) then
          y.downto(0).each { |suby|
            if(arr[x][suby] != 0) then
              arr[x][y] = arr[x][suby]
              arr[x][suby] = 0
              board_moved = true
              break
            end
          }
        end
      }
    }
    board_moved
  end

  def merge_right!(arr)
    merged = false
    (0..3).each { |x|
      3.downto(0).each { |y|
        if(arr[x][y] == arr[x][y-1]) then
          arr[x][y] += arr[x][y]
          arr[x][y-1] = 0
          merged = true unless arr[x][y] == 0
        end
      } 
    }    

    slide_right!(arr)
    merged
  end

  def slide_down!(arr)
    board_moved = false
    3.downto(0).each { |x|
      (0..3).each { |y|
        if(arr[x][y] == 0) then
          x.downto(0).each { |subx|
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

  def merge_down!(arr)
    merged = false
    3.downto(1) { |x|
      (0..3).each { |y|
        if(arr[x][y] == arr[x-1][y]) then
          arr[x][y] += arr[x][y]
          arr[x-1][y] = 0
          merged = true unless arr[x][y] == 0
        end
      }
    }

    slide_down!(arr)
    merged
  end
end
