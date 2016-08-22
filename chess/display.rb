require_relative 'board'
require_relative 'cursor'
require 'colorize'

class Display
  attr_reader :board
  def initialize(board = Board.new)
    @cursor = Cursor.new([0,0], board)
    @board = board
    @board.populate
  end

  def render
    system 'clear'
    # debugger
    @board[@cursor.cursor_pos].display.colorize(:red)
    puts  "  #{(0..7).to_a.join(" ")}"
    @board.grid.each.with_index do |row, i|
      build_row(row, i)
      puts
    end
  end

  def build_row(row, i)
    print "#{i} "
    row.each_with_index do |col, j|
      if [i, j] == @cursor.cursor_pos
        print col.display.colorize(:green) + " "
      else
        print col.display + " "
      end
    end
  end

  def cursor_move
    loop do
      render
      @cursor.get_input
    end
  end

end
