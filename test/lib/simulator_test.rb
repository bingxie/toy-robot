require_relative '../test_helper'

class SimulatorTest < Minitest::Test
  def setup
    @simulator = Simulator.new
  end

  def test_execute
    @simulator.execute('PLACE 1,2,EAST')
    @simulator.execute('MOVE')
    @simulator.execute('MOVE')
    @simulator.execute('LEFT')
    @simulator.execute('MOVE')
    @simulator.execute('RIGHT')
    @simulator.execute('REPORT')

    assert_equal '3,3,EAST', @simulator.robot.report
  end

  def test_execute_with_bad_inputs
    @simulator.execute('LEFT')
    @simulator.execute('PLACE 0,0,WEST')
    @simulator.execute('PLACE 0,0,ABC')
    @simulator.execute('MOVE')

    assert_equal '0,0,WEST', @simulator.robot.report
  end

  def test_execute_bad_input
    io = Minitest::Mock.new
    simulator = Simulator.new(io)

    io.expect(:puts, nil, ['Please input correct command'])
    simulator.execute('BAD')

    io.verify
  end
end
