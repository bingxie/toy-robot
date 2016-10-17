require_relative '../../test_helper'

module Commands
  class PlaceTest < Minitest::Test
    def test_run_command
      robot = Minitest::Mock.new

      place_command = Commands::Place.new(robot, STDOUT)
      robot.expect(:place, nil, ['1', '2', 'EAST'])
      place_command.run('PLACE 1,2,EAST')

      robot.verify
    end

    def test_output_exception
      io = Minitest::Mock.new
      robot = Minitest::Mock.new

      def robot.place(*args)
        raise RobotError, 'Invalid facing'
      end

      place_command = Commands::Place.new(robot, io)
      io.expect(:puts, nil, ['Invalid facing'])
      place_command.run('PLACE 1,2,ELSE')

      io.verify
    end
  end
end
