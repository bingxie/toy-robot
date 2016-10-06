require_relative './command'

module Commands
  class Bad < Command
    def run(*command)
      run_command do
        @io.puts 'Please input correct command'
      end
    end
  end
end
