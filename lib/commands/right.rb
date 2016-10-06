require_relative './command'

module Commands
  class Right < Command
    def run(command)
      run_command do
        @robot.turn_right
      end
    end
  end
end
