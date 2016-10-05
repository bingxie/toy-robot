class Table
  def initialize(length = 5, width = 5)
    raise 'Table must have at least one grid' if length < 0 || width < 0
    @length = 5
    @width = 5
  end

  def inside?(position)
    inside_length?(position.x) && inside_width?(position.y)
  end

  private

  def inside_length?(x)
    x >= 0 && x < @length
  end

  def inside_width?(y)
    y >= 0 && y < @width
  end
end
