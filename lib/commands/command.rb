module Commonds
  class Command
    def initialize(robot, io)
      @robot = robot
      @io = io
    end

    def run(command)
      raise NotImplementedError
    end

    private

    def run_commond
      yield if block_given?
    rescue RobotError => e
      @io.puts e.message
    end
  end
end
