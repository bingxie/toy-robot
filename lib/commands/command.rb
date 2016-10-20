require_relative '../robot_error'

module Commands
  class Command
    def initialize(robot, io)
      @robot = robot
      @io = io
    end

    def run(*command)
      run_command do
        raise NotImplementedError
      end
    end

    private

    def run_command
      yield if block_given?
    rescue RobotError => e
      @io.puts e.message
    end
  end
end
