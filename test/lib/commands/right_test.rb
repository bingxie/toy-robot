require_relative '../../test_helper'

module Commands
  class RightTest < Minitest::Test
    def test_run_command
      robot = Minitest::Mock.new
      right_command = Commands::Right.new(robot, STDOUT)

      robot.expect(:turn_right, nil)
      right_command.run

      robot.verify
    end
  end
end
