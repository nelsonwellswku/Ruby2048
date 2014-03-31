class ArrayValueSlider
  def up!(arr)
    slide_up!(arr) 
    merge_up!(arr)
  end

  def down!(arr)
    (0..2).each { |x|
      (0..3).each { |y|
        unless(arr[x][y] == 0)
          arr[x+1][y] = arr[x][y]
          arr[x][y] = 0
        end
      } 
    }
  end

  def left!(arr)
    3.downto(1).each { |y|
      (0..3).each { |x|
        unless(arr[x][y] == 0)
          arr[x][y-1] = arr[x][y]
          arr[x][y] = 0
        end
      }
    }
  end

  def right!(arr)
    (0..2).each { |y|
      (0..3).each { |x|
        unless(arr[x][y] == 0)
          arr[x][y+1] = arr[x][y]
          arr[x][y] = 0
        end
      }
    }
  end

  private

  def slide_up!(arr)
    (0..3).each { |x|
      (0..3).each { |y|
        if(arr[x][y] == 0)
          (x..3).each { |subx| 
            if(arr[subx][y] != 0) then
              arr[x][y] = arr[subx][y]
              arr[subx][y] = 0
              break;
            end 
          }
        end
      }
    }  
  end

  def merge_up!(arr)
    [0, 2].each { |x|
      (0..3).each { |y|
        if(arr[x][y] == arr[x+1][y]) then
          arr[x][y] += arr[x][y] 
          arr[x+1][y] = 0
        end
      }
    }

    slide_up!(arr)
  end
end
