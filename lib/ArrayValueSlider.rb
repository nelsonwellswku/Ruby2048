class ArrayValueSlider
  def up!(arr)
    3.downto(1).each { |x|
      (0..3).each { |y|
        unless(arr[x][y] == 0)
          arr[x-1][y] = arr[x][y]
          arr[x][y] = 0 
        end 
      }
    }
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

  end

  def right!(arr)

  end
end
