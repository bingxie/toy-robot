require_relative './command'

module Commands
  class Turn < Command
    def run(*command)
      run_command do
        direction = command.first
        @robot.send("turn_#{direction.downcase}")
      end
    end
  end
end
