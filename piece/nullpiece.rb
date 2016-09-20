require 'singleton'

class NullPiece
  include Singleton

  def initialize
    @symbol = " "
  end

  def to_s
    @symbol
  end
end

# n = NullPiece.new
# puts NullPiece.new.to_s
puts NullPiece.instance.to_s
