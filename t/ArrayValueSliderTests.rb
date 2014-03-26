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

  def test_simple_slide_down
    
    # arrange
    arr = [
      [2, 0, 2, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0]
    ]

    expected_arr = [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [2, 0, 2, 0]
    ]

    # act
    slider = ArrayValueSlider.new
    slider.down!(arr) 

    # assert
    assert_equal(expected_arr, arr)

  end 

  def test_simple_slide_right
    
    # arrange
    arr = [
      [0, 0, 0, 0],
      [2, 0, 0, 0],
      [0, 0, 0, 0],
      [2, 0, 0, 0]
    ] 

    expected_arr = [
      [0, 0, 0, 0],
      [0, 0, 0, 2],
      [0, 0, 0, 0],
      [0, 0, 0, 2]
    ]
    
    # act
    slider = ArrayValueSlider.new
    slider.right!(arr)
    
    # assert
    assert_equal(expected_arr, arr)
  end

  def test_simple_slide_left
    
    # arrange
    arr = [
      [0, 0, 0, 2],
      [0, 0, 0, 0],
      [0, 0, 0, 2],
      [0, 0, 0, 0]
    ] 

    expected_arr = [
      [2, 0, 0, 0],
      [0, 0, 0, 0],
      [2, 0, 0, 0],
      [0, 0, 0, 0]
    ]
    
    # act
    slider = ArrayValueSlider.new
    slider.left!(arr)
    
    # assert
    assert_equal(expected_arr, arr)
  end

end
