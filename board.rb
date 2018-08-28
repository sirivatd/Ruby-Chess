require_relative "piece.rb"
require 'colorize'

class Board 
  attr_accessor :chessboard
  
  def initialize
    @chessboard = Array.new(8) {[]}
    i = 0
    while i < 8
      j = 0
      while j < 8
        if i < 2 || i > 5 
          @chessboard[i][j] = Piece.new
        else
          @chessboard[i][j] = NullPiece.new
        end
          j += 1
      end
      i += 1
    end
    
    def render(cursor_pos)
      x,y = cursor_pos
      i = 0
      while i < @chessboard.length
        j = 0
          while j < @chessboard.length
            if @chessboard[i][j].is_a?(NullPiece)
              if [i,j] == [x,y]
                print " 0 ".red
              else 
                print " O "
              end
            else
              if [i,j] == [x,y]
                print " X ".blue
              else 
                print " X "
              end
            end
            j += 1
          end 
          puts ""
          i += 1
        end
    end
    
    
  end
  
  def valid_pos?(pos)
    posX, posY = pos
    return false unless @chessboard[posX][posY].is_a?(NullPiece) || posX > 7 || posX < 0 || posY > 7 || posY < 0
    return true
    
  end
  
  def move_piece(start_pos, end_pos)
      startX, startY = start_pos
      raise StandardError unless valid_pos?([startX,startY])
      endX, endY = end_pos
      raise "you're off the board" if endX < 0 || endX > 7 || endY < 0 || endY > 7
      raise "there is a piece here" unless @chessboard[endX][endY].is_a?(NullPiece)  
      temp = @chessboard[startX][startY]
      @chessboard[startX][startY] = @chessboard[endX][endY]
      @chessboard[endX][endY] = temp
      render
  end
  
end