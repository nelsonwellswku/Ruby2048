class ArrayValueSlider
  def up!(arr)
    3.downto(0).each { |x|
      (0..3).each { |y|
        next if x == 0
        unless(arr[x][y] == 0)
          arr[x-1][y] = arr[x][y]
          arr[x][y] = 0 
        end 
      }
    }
  end

  def down!(arr)

  end

  def left!(arr)

  end

  def right!(arr)

  end
end
