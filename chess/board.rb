require_relative 'pieces/piece'
require_relative 'pieces/nullpiece'

class BoardError < StandardError
end

class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(8) { Array.new(8, NullPiece.new) }
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos,value)
    x, y = pos
    @grid[x][y] = value
  end

  def populate
    @grid.each_with_index do |row, i|
      row.map! do |col|
        if [0, 1, 6, 7].include?(i)
          col = Piece.new
        end
      end
    end
  end


  def in_bounds?(pos)
    x, y = pos
    x.between?(0,7) && y.between?(0,7)
  end

  # def move(start, end_pos)
  #   begin
  #     if @board[start].is_a? NullPiece
  #       raise BoardError.new("No piece at position!")
  #     else
  #       @board[end_pos] = @board[start]
  #       @board[start] = NullPiece
  #     end
  #   rescue BoardError => e
  #     puts e.message
  #     retry
  #   end
  # end

  def valid_move?(move)
  end

end
