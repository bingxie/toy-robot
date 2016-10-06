require_relative './command'

module Commands
  class Left < Command
    def run(command)
      run_command do
        @robot.turn_left
      end
    end
  end
end
