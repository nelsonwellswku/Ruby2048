require "minitest/autorun"
require_relative "../lib/ArrayValueSlider"

class ArrayValueSliderTests < Minitest::Test
  
  def test_simple_slide_up

    # arrange
    arr = [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 2, 0, 2]
    ]
 
    expected_arr = [
      [0, 2, 0, 2],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0]
    ]

    # act
    slider = ArrayValueSlider.new
    slider.up!(arr)

    # assert
    assert_equal(expected_arr, arr)
    
  end

  

end
