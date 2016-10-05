require_relative '../test_helper'

class TableTest < Minitest::Test
  def setup
    @table = Table.new
  end

  def test_inside?
    assert @table.inside?(4, 4)
    assert @table.inside?(0, 4)
  end

  def test_not_inside?
    refute @table.inside?(5, 4)
    refute @table.inside?(0, 5)
  end
end
