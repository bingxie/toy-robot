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

  def test_not_placed?
    refute @robot.placed?
  end

  def test_not_placed_without_facing
    @robot.place(Position.new(2, 3), nil)
    refute @robot.placed?
  end

  def test_not_placed_without_position
    @robot.place(nil, :WEST)
    refute @robot.placed?
  end

  def test_placed?
    @robot.place(Position.new(2, 3), :WEST)

    assert @robot.placed?
  end

  class TurnTest < Minitest::Test
    def setup
      @robot = Robot.new(Table.new)
      @robot.place(Position.new(2, 3), :WEST)
    end

    def test_turn_left
      @robot.turn_left

      assert_equal :SOUTH, @robot.facing
    end

    def test_turn_right
      @robot.turn_right

      assert_equal :NORTH, @robot.facing
    end
  end
end
