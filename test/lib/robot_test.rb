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

  class MoveTest < Minitest::Test
    def setup
      @robot = Robot.new(Table.new)
    end

    def test_move_forward_east
      @robot.place(Position.new(2, 3), :EAST)
      @robot.move_forward

      assert_equal 3, @robot.position.x
      assert_equal 3, @robot.position.y
    end

    def test_move_forward_south
      @robot.place(Position.new(2, 3), :SOUTH)
      @robot.move_forward

      assert_equal 2, @robot.position.x
      assert_equal 2, @robot.position.y
    end

    def test_move_forward_west
      @robot.place(Position.new(2, 3), :WEST)
      @robot.move_forward

      assert_equal 1, @robot.position.x
      assert_equal 3, @robot.position.y
    end

    def test_move_forward_north
      @robot.place(Position.new(2, 3), :NORTH)
      @robot.move_forward

      assert_equal 2, @robot.position.x
      assert_equal 4, @robot.position.y
    end
  end
end
