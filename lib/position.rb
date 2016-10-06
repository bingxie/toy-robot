class Position
  attr_reader :x, :y

  def initialize(x, y)
    @x = x.to_i
    @y = y.to_i
  end

  def east
    Position.new(@x + 1, @y)
  end

  def south
    Position.new(@x, @y - 1)
  end

  def west
    Position.new(@x - 1, @y)
  end

  def north
    Position.new(@x, @y + 1)
  end

  def to_s
    "#{x},#{y}"
  end
end
