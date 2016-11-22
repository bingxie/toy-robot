require_relative './command'

module Commands
  class Place < Command
    PATTERN = /^PLACE (\d),(\d),([A-Z]+)/
    def run(*command)
      run_command do
        results = command.first.match(PATTERN)
        @robot.place(results[1], results[2], results[3])
      end
    end
  end
end
