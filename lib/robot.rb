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

  private

  def move_to(position)
    @position = position if @table.inside?(position)
  end

  def face(facing)
    @facing = facing if FACINGS.include?(facing)
  end
end
