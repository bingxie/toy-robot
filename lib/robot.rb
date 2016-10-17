require_relative 'position'

class Robot
  FACINGS = [:EAST, :SOUTH, :WEST, :NORTH].freeze

  attr_reader :position, :facing

  def initialize(table)
    @table = table
    @position = nil
    @facing = nil
  end

  def place(x, y, facing)
    raise(RobotError, 'Position x and y is required') unless x && y

    move_to(Position.new(x, y))
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

  def move_forward
    placed_check

    move_to(position.send(@facing.downcase))
  end

  def move_backward
    placed_check

    move_to(position.send(opposite_facing.downcase))
  end

  def report
    placed_check

    "#{@position},#{@facing}"
  end

  private

  def move_to(position)
    raise(RobotError, 'Outside table') unless @table.inside?(position)

    @position = position
  end

  def face(facing)
    raise(RobotError, 'Invalid facing') unless FACINGS.include?(facing)

    @facing = facing
  end

  def rotate_clockwise(steps)
    placed_check

    @facing = rotate_facing(steps)
  end

  def opposite_facing
    rotate_facing(2)
  end

  def rotate_facing(steps)
    FACINGS.rotate(FACINGS.index(@facing)).rotate(steps).first
  end

  def placed_check
    raise(RobotError, 'Not placed') unless placed?
  end
end
