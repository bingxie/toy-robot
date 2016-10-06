require_relative '../../test_helper'

module Commands
  class ReportTest < Minitest::Test
    def test_run_command
      io = Minitest::Mock.new
      robot = Minitest::Mock.new
      report_command = Commands::Report.new(robot, io)

      robot.expect(:report, '1,2,NORTH')
      io.expect(:puts, nil, ['1,2,NORTH'])

      report_command.run

      robot.verify
      io.verify
    end
  end
end
