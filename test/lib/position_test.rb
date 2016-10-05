require_relative '../test_helper'

class PositionTest < Minitest::Test
  def setup
    @position = Position.new(2, 3)
  end

  def test_to_s
    assert_equal '2,3', @position.to_s
  end
end
