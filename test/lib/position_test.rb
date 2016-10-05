require_relative '../test_helper'

class PositionTest < Minitest::Test
  def setup
    @position = Position.new(2, 3)
  end

  def test_to_s
    assert_equal '2,3', @position.to_s
  end

  def test_north
    @position.north

    assert_equal 4, @position.y
  end

  def test_east
    @position.east

    assert_equal 3, @position.x
  end

  def test_west
    @position.west

    assert_equal 1, @position.x
  end

  def test_south
    @position.south

    assert_equal 2, @position.y
  end
end
