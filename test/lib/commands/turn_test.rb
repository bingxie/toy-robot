require_relative '../../test_helper'

module Commands
  class TurnTest < Minitest::Test
    def setup
      @robot = Minitest::Mock.new
      @turn_command = Commands::Turn.new(@robot, STDOUT)
    end

    def test_run_command_left
      @robot.expect(:turn_left, nil)
      @turn_command.run('LEFT')

      @robot.verify
    end

    def test_run_command_right
      @robot.expect(:turn_right, nil)
      @turn_command.run('RIGHT')

      @robot.verify
    end

    def test_run_command_around
      @robot.expect(:turn_around, nil)
      @turn_command.run('AROUND')

      @robot.verify
    end
  end
end
