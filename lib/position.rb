class Position
  attr_reader :x, :y

  def initialize(x, y)
    @x = x.to_i
    @y = y.to_i
  end

  def east
    self.class.new(@x + 1, @y)
  end

  def south
    self.class.new(@x, @y - 1)
  end

  def west
    self.class.new(@x - 1, @y)
  end

  def north
    self.class.new(@x, @y + 1)
  end

  def to_s
    "#{x},#{y}"
  end
end
