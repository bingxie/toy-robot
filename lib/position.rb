class Position
  attr_reader :x, :y

  def initialize(x, y)
    @x = x.to_i
    @y = y.to_i
  end

  def east
    @x += 1
    self
  end

  def south
    @y -= 1
    self
  end

  def west
    @x -= 1
    self
  end

  def north
    @y += 1
    self
  end

  def to_s
    "#{x},#{y}"
  end
end
