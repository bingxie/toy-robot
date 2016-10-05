class Position
  attr_reader :x, :y

  def initialize(x, y)
    @x = x.to_i
    @y = y.to_i
  end

  def to_s
    "#{x},#{y}"
  end
end
