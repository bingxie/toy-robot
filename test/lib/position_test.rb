require_relative '../test_helper'

class PositionTest < Minitest::Test
  def setup
    @position = Position.new(2, 3)
  end

  def test_to_s
    assert_equal '2,3', @position.to_s
  end

  def test_north
    new_position = @position.north

    refute_equal new_position, @position
    assert_equal 4, new_position.y
  end

  def test_east
    new_position = @position.east

    refute_equal new_position, @position
    assert_equal 3, new_position.x
  end

  def test_west
    new_position = @position.west

    refute_equal new_position, @position
    assert_equal 1, new_position.x
  end

  def test_south
    new_position = @position.south

    refute_equal new_position, @position
    assert_equal 2, new_position.y
  end
end
