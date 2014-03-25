require './Board'
require './BoardRenderer'

board = Board.new
board_renderer = BoardRenderer.new(board)
board_renderer.draw
