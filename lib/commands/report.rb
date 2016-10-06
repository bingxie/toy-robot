require_relative './command'

module Commands
  class Report < Command
    def run(*command)
      run_command do
        @io.puts @robot.report
      end
    end
  end
end
