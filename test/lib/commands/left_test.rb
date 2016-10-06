require_relative '../../test_helper'

module Commands
  class LeftTest < Minitest::Test
    def test_run_command
      robot = Minitest::Mock.new
      left_command = Commands::Left.new(robot, STDOUT)

      robot.expect(:turn_left, nil)
      left_command.run('LEFT')

      robot.verify
    end
  end
end
