class Robot
  FACINGS = [:EAST, :SOUTH, :WEST, :NORTH].freeze

  attr_reader :position, :facing

  def initialize(table)
    @table = table
    @position = nil
    @facing = nil
  end

  def place(position, facing)
    move_to(position)
    face(facing)
  end

  def placed?
    @position && @facing
  end

  def turn_left
    rotate_clockwise(-1)
  end

  def turn_right
    rotate_clockwise(1)
  end

  private

  def move_to(position)
    @position = position if @table.inside?(position)
  end

  def face(facing)
    @facing = facing if FACINGS.include?(facing)
  end

  def rotate_clockwise(steps)
    @facing = FACINGS.rotate(FACINGS.index(@facing)).rotate(steps).first if placed?
  end
end
