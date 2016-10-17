require_relative '../test_helper'

class FacingTest < Minitest::Test
  def setup
    @facing = Facing.new('EAST')
  end

  def test_valid?
    assert Facing.valid?('SOUTH')
  end

  def test_not_valid?
    refute Facing.valid?('ABC')
  end

  def test_rotate_facing
    assert_equal 'SOUTH', @facing.rotate(1).to_s

    assert_equal 'NORTH', @facing.rotate(-1).to_s
  end

  def test_opposite
    assert_equal 'WEST', @facing.opposite.to_s

    assert_equal 'NORTH', Facing.new('SOUTH').opposite.to_s
  end

  def test_to_s
    assert_equal 'EAST', @facing.to_s
  end
end
