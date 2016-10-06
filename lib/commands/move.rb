require_relative './command'

module Commands
  class Move < Command
    def run(*command)
      run_command do
        @robot.move_forward
      end
    end
  end
end
