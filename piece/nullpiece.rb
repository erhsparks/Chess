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
