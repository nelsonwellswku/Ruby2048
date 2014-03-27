require "minitest/autorun"
require_relative "../lib/ArrayValueSlider"

class ArrayValueSliderTests < Minitest::Test

  def test_simple_slide_up

    # arrange
    arr = [
      zeros,
      zeros,
      zeros,
      [0, 2, 0, 2]
    ]
 
    expected_arr = [
      [0, 2, 0, 2],
      zeros,
      zeros,
      zeros
    ]

    # act
    slider = ArrayValueSlider.new
    slider.up!(arr)

    # assert
    assert_equal(expected_arr, arr)
    
  end

  def test_simple_impact_no_merge_up
    
    # arrange
    arr = [
      [0, 0, 4, 0],
      [4, 2, 0, 0],
      [0, 4, 2, 2],
      [2, 0, 0, 4]
    ]

    expected_arr = [
      [4, 2, 4, 2],
      [2, 4, 2, 4],
      zeros,
      zeros 
    ]

    # act
    slider = ArrayValueSlider.new
    slider.up!(arr)
   
    # assert
    assert_equal(expected_arr, arr)
  end
  
  def test_simple_impact_merge_up
    
    # arrange
    arr = [
      zeros,
      [2, 4, 8, 16],
      zeros,
      [2, 4, 8, 16]
    ]

    expected_arr = [
      [4, 8, 16, 32],
      zeros,
      zeros,
      zeros
    ]

    # act
    slider = ArrayValueSlider.new
    slider.up!(arr)

    # assert
    assert_equal(expected_arr, arr)

  end

  def test_three_impact_merge_up

    # arrange
    arr = [
      zeros,
      [2, 4, 8, 16],
      [2, 4, 8, 16],
      [2, 4, 8, 16]
    ]   
    
    expected_arr = [
      [4, 8, 16, 32],
      [2, 4, 8, 16],
      zeros,
      zeros
    ]

    # act
    slider = ArrayValueSlider.new
    slider.up!(arr)    
    
    # assert
    assert_equal(expected_arr, arr)

  end

  def test_four_impact_merge_up

    # arrange
    arr = [
      [2, 4, 8, 16],
      [2, 4, 8, 16],
      [2, 0, 8, 16],
      [2, 4, 8, 16]
    ]   
    
    expected_arr = [
      [4, 8, 16, 32],
      [4, 4, 16, 32],
      zeros,
      zeros
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
      zeros,
      zeros,
      zeros
    ]

    expected_arr = [
      zeros,
      zeros,
      zeros,
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
      zeros,
      [2, 0, 0, 0],
      zeros,
      [2, 0, 0, 0]
    ] 

    expected_arr = [
      zeros,
      [0, 0, 0, 2],
      zeros,
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
      zeros,
      [0, 0, 0, 2],
      zeros
    ] 

    expected_arr = [
      [2, 0, 0, 0],
      zeros,
      [2, 0, 0, 0],
      zeros
    ]
    
    # act
    slider = ArrayValueSlider.new
    slider.left!(arr)
    
    # assert
    assert_equal(expected_arr, arr)
  end

  private

  def zeros 
    [0, 0, 0, 0]
  end
  
end
