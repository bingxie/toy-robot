require_relative './command'

module Commands
  class Place < Command
    def run(*command)
      run_command do
        results = command.first.match(/^PLACE (\d),(\d),([A-Z]+)/)
        @robot.place(results[1], results[2], results[3])
      end
    end
  end
end
