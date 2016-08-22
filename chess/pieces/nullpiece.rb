class NullPiece
  attr_reader :display
  def initialize
    @display = "o"
  end
end


# class NullPiece
#
#   attr_reader :symbol
#
#   def initialize(symbol = " ", side = nil)
#     @symbol = symbol
#     @side = side
#   end
# end
#
# class King < Piece
#   def initialize(symbol, side)
#     side == "black" ? super("♚") : super("♔")
#   end
# end
#
# class Queen < Piece
#   def initialize(symbol, side)
#     side == "black" ? super("♛") : super("♕")
#   end
# end
#
# class Bishop < Piece
#   def initialize(symbol, side)
#     side == "black" ? super("♝") : super("♗")
#   end
# end
#
# class Knight < Piece
#   def initialize(symbol, side)
#     side == "black" ? super("♞") : super("♘")
#   end
# end
#
# class Rook < Piece
#   def initialize(symbol, side)
#     side == "black" ? super("♜") : super("♖")
#   end
# end
#
# class Pawn < Piece
#   def initialize(symbol, side)
#     side == "black" ? super("♟") : super("♙")
#   end
# end
