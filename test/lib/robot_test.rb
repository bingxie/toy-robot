require_relative '../test_helper'

class RobotTest < Minitest::Test
  NOT_PLACED_MESSAGE = 'Not placed, Please use PLACE command to start'.freeze

  def setup
    @robot = Robot.new(Table.new)
  end

  def test_report
    @robot.place(2, 3, 'NORTH')

    assert_equal '2,3,NORTH', @robot.report
  end

  def test_report_when_not_placed
    exception = assert_raises RobotError do
      @robot.report
    end

    assert_equal NOT_PLACED_MESSAGE, exception.message
  end

  class PlaceTest < Minitest::Test
    def setup
      @robot = Robot.new(Table.new)
    end

    def test_place
      @robot.place(2, 3, 'NORTH')

      assert_equal 2, @robot.position.x
      assert_equal 3, @robot.position.y
      assert_equal 'NORTH', @robot.facing.to_s
    end

    def test_not_placed?
      refute @robot.placed?
    end

    def test_not_placed_without_facing
      exception = assert_raises RobotError do
        @robot.place(2, 3, nil)
      end
      assert_equal 'Invalid facing', exception.message

      refute @robot.placed?
    end

    def test_not_placed_without_position
      exception = assert_raises RobotError do
        @robot.place(nil, 1, 'WEST')
      end
      assert_equal 'Position x and y is required', exception.message

      refute @robot.placed?
    end

    def test_placed?
      @robot.place(2, 3, 'WEST')

      assert @robot.placed?
    end
  end

  class TurnTest < Minitest::Test
    def setup
      @robot = Robot.new(Table.new)
      @robot.place(2, 3, 'WEST')
    end

    def test_turn_left
      @robot.turn_left

      assert_equal 'SOUTH', @robot.facing.to_s
    end

    def test_turn_right
      @robot.turn_right

      assert_equal 'NORTH', @robot.facing.to_s
    end

    def test_turn_around
      @robot.turn_around
      assert_equal 'EAST', @robot.facing.to_s

      @robot.turn_around
      assert_equal 'WEST', @robot.facing.to_s
    end

    def test_turn_when_not_placed
      @robot = Robot.new(Table.new)

      exception = assert_raises RobotError do
        @robot.turn_right
      end

      assert_equal NOT_PLACED_MESSAGE, exception.message
    end
  end

  class MoveForwardTest < Minitest::Test
    def setup
      @robot = Robot.new(Table.new)
    end

    def test_move_forward_east
      @robot.place(2, 3, 'EAST')
      @robot.move_forward

      assert_equal 3, @robot.position.x
      assert_equal 3, @robot.position.y
    end

    def test_move_forward_south
      @robot.place(2, 3, 'SOUTH')
      @robot.move_forward

      assert_equal 2, @robot.position.x
      assert_equal 2, @robot.position.y
    end

    def test_move_forward_west
      @robot.place(2, 3, 'WEST')
      @robot.move_forward

      assert_equal 1, @robot.position.x
      assert_equal 3, @robot.position.y
    end

    def test_move_forward_north
      @robot.place(2, 3, 'NORTH')
      @robot.move_forward

      assert_equal 2, @robot.position.x
      assert_equal 4, @robot.position.y
    end

    def test_move_when_not_placed
      exception = assert_raises RobotError do
        @robot.move_forward
      end

      assert_equal NOT_PLACED_MESSAGE, exception.message
    end

    def test_move_outside_table
      @robot.place(0, 3, 'WEST')

      exception = assert_raises RobotError do
        @robot.move_forward
      end
      assert_equal 'Outside table', exception.message
    end
  end

  class MoveBackwardTest < Minitest::Test
    def setup
      @robot = Robot.new(Table.new)
    end

    def test_move_backward_east
      @robot.place(2, 3, 'EAST')
      @robot.move_backward

      assert_equal 1, @robot.position.x
      assert_equal 3, @robot.position.y
    end

    def test_move_backward_south
      @robot.place(2, 3, 'SOUTH')
      @robot.move_backward

      assert_equal 2, @robot.position.x
      assert_equal 4, @robot.position.y
    end

    def test_move_backward_west
      @robot.place(2, 3, 'WEST')
      @robot.move_backward

      assert_equal 3, @robot.position.x
      assert_equal 3, @robot.position.y
    end

    def test_move_backward_north
      @robot.place(2, 3, 'NORTH')
      @robot.move_backward

      assert_equal 2, @robot.position.x
      assert_equal 2, @robot.position.y
    end

    def test_move_when_not_placed
      exception = assert_raises RobotError do
        @robot.move_backward
      end

      assert_equal NOT_PLACED_MESSAGE, exception.message
    end

    def test_move_outside_table
      @robot.place(0, 3, 'EAST')

      exception = assert_raises RobotError do
        @robot.move_backward
      end
      assert_equal 'Outside table', exception.message
    end
  end
end
