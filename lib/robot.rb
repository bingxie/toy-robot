class Robot
  FACINGS = [:EAST, :SOUTH, :WEST, :NORTH].freeze

  attr_reader :position, :facing

  def initialize(table)
    @table = table
    @position = nil
    @facing = nil
  end

  def place(position, facing)
    raise(RobotError, 'Position is required') unless position

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

  def move_forward
    raise(RobotError, 'Not placed') unless placed?

    move_to(position.send(@facing.downcase))
  end

  def report
    "#{@position},#{@facing}" if placed?
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
    raise(RobotError, 'Not placed') unless placed?

    @facing = FACINGS.rotate(FACINGS.index(@facing)).rotate(steps).first
  end
end
