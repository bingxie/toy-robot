class Robot
  FACINGS = [:EAST, :SOUTH, :WEST, :NORTH].freeze

  attr_reader :position, :facing

  def initialize(table)
    @table = table
  end

  def place(position, facing)
    move_to(position)
    face(facing)
  end

  private

  def move_to(position)
    @position = position if @table.inside?(position)
  end

  def face(facing)
    @facing = facing if FACINGS.include?(facing)
  end
end
