require_relative './command'

module Commonds
  class Place < Command
    def run(command)
      run_commond do
        results = command.match(/^PLACE (\d),(\d),([A-Z]+)/)
        @robot.place(results[1], results[2], results[3].to_sym)
      end
    end
  end
end
