require "minitest/autorun"
require_relative "../lib/Board"

class FakeSlider
  def up!(arr)
    arr[0][0] = :up    
  end

  def down!(arr)
    arr[0][0] = :down
  end

  def left!(arr)
    arr[0][0] = :left
  end

  def right!(arr)
    arr[0][0] = :right
  end
end

class BoardTests < Minitest::Test
  def test_init
    expected = [
      [0, 0, 0, 0],
      [2, 2, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0]
    ]

    board = Board.new
    assert_equal(expected, board.board) 
  end 

  def test_up_calls_up
    board = Board.new(FakeSlider.new)
    board.slide_up!
    assert_corner_value(board.board, :up)
  end

  def test_down_calls_down
    board = Board.new(FakeSlider.new)
    board.slide_down!
    assert_corner_value(board.board, :down)
  end

  def test_left_calls_left
    board = Board.new(FakeSlider.new)
    board.slide_left!
    assert_corner_value(board.board, :left)
  end

  def test_right_calls_right
    board = Board.new(FakeSlider.new)
    board.slide_right!
    assert_corner_value(board.board, :right)
  end
  
  private

  def assert_corner_value(arr, val)
    assert_equal(val, arr[0][0])
  end
end
