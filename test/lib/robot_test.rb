require_relative '../test_helper'

class RobotTest < Minitest::Test
  def setup
    @robot = Robot.new(Table.new)
  end

  def test_place
    position = Position.new(2, 3)
    facing = :NORTH

    @robot.place(position, facing)

    assert_equal position, @robot.position
    assert_equal :NORTH, @robot.facing
  end
end
