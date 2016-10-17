require_relative './command'

module Commands
  class Around < Command
    def run(*command)
      run_command do
        @robot.turn_around
      end
    end
  end
end
