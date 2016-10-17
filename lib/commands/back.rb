require_relative './command'

module Commands
  class Back < Command
    def run(*command)
      run_command do
        @robot.move_backward
      end
    end
  end
end
