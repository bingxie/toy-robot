require_relative '../../test_helper'

module Commands
  class BadTest < Minitest::Test
    def test_run_command
      io = Minitest::Mock.new
      robot = Minitest::Mock.new

      bad_command = Commands::Bad.new(robot, io)

      io.expect(:puts, nil, ['Please input correct command'])

      bad_command.run

      io.verify
    end
  end
end
