require_relative '../../test_helper'

module Commands
  class MoveTest < Minitest::Test
    def test_run_command
      robot = Minitest::Mock.new
      move_command = Commands::Move.new(robot, STDOUT)

      robot.expect(:move_forward, nil)
      move_command.run

      robot.verify
    end
  end
end
