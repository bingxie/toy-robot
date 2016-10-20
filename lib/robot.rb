require_relative 'position'
require_relative 'facing'

class Robot
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

  def turn_around
    rotate_clockwise(2)
  end

  def move_forward
    placed_check

    move_to(position.send(@facing.to_s.downcase))
  end

  def move_backward
    placed_check

    move_to(position.send(@facing.opposite.to_s.downcase))
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
    raise(RobotError, 'Invalid facing') unless Facing.valid?(facing)

    @facing = Facing.new(facing)
  end

  def rotate_clockwise(steps)
    placed_check

    @facing = @facing.rotate(steps)
  end

  def placed_check
    raise(RobotError, 'Not placed, Please use PLACE command to start') unless placed?
  end
end
