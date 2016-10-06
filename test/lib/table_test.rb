require_relative '../test_helper'

class TableTest < Minitest::Test
  def setup
    @table = Table.new(4, 4)
  end

  def test_inside?
    position = Position.new(2, 1)
    assert @table.inside?(position)

    position = Position.new(0, 3)
    assert @table.inside?(position)
  end

  def test_not_inside?
    position = Position.new(4, 3)
    refute @table.inside?(position)

    position = Position.new(0, 4)
    refute @table.inside?(position)
  end

  def test_wrong_arguments
    assert_raises ArgumentError do
      Table.new(0, 1)
    end
  end
end
