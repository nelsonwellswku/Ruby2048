require "minitest/autorun"
require_relative "../lib/Board"

class FakeBoardSetterSlider
  def up!(arr)
    (0..3).each { |x|
      (0..3).each { |y|
        arr[x][y] = 2
      }
    }
  end
end

class BoardTests < Minitest::Test
  def setup
    @slider_mock = Minitest::Mock.new
    @board = Board.new(@slider_mock)
  end

  def test_init
    expected = [
      [0, 0, 0, 0],
      [2, 2, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0]
    ]

    assert_equal(expected, @board.board) 
  end 

  def test_up_calls_up
    @slider_mock.expect(:up!, nil, [@board.board])
    @board.slide_up!
    @slider_mock.verify
  end

  def test_down_calls_down
    @slider_mock.expect(:down!, nil, [@board.board])
    @board.slide_down!
    @slider_mock.verify
  end

  def test_left_calls_left
    @slider_mock.expect(:left!, nil, [@board.board])
    @board.slide_left!
    @slider_mock.verify
  end

  def test_right_calls_right
    @slider_mock.expect(:right!, nil, [@board.board])
    @board.slide_right!
    @slider_mock.verify
  end

  def test_game_over_is_game_over
    board = Board.new(FakeBoardSetterSlider.new)
    board.slide_up!
    
    assert_equal(true, board.game_over?) 
  end

  def test_game_over_is_not_game_over
    board = Board.new
    assert_equal(false, board.game_over?)  
  end

  private

  def assert_corner_value(arr, val)
    assert_equal(val, arr[0][0])
  end
end
