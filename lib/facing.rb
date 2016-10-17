class Facing
  FACINGS = %w(EAST SOUTH WEST NORTH).freeze

  def initialize(val)
    @val = val
  end

  def self.valid?(val)
    FACINGS.include?(val)
  end

  def rotate(steps)
    Facing.new(FACINGS.rotate(FACINGS.index(@val)).rotate(steps).first)
  end

  def opposite
    rotate(2)
  end

  def to_s
    @val
  end
end
