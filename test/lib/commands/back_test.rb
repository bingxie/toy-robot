require_relative '../../test_helper'

module Commands
  class BackTest < Minitest::Test
    def test_run_command
      robot = Minitest::Mock.new
      back_command = Commands::Back.new(robot, STDOUT)

      robot.expect(:move_backward, nil)
      back_command.run

      robot.verify
    end
  end
end
