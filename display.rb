require_relative 'cursor'
require_relative 'board.rb'

class Display
  attr_reader :cursor, :board
  def initialize
    @board = Board.new
    @cursor = Cursor.new([1,1], board)
  end
  
  def play
    while(1)
      @cursor.get_input
      @board.render(@cursor.cursor_pos)
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  a = Display.new
  a.board.render(a.cursor.cursor_pos)
  a.play
end