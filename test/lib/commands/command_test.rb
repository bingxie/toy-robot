require_relative '../../test_helper'

module Commands
  class CommandTest < Minitest::Test
    def test_command_run
      command = Commands::Command.new(nil, nil)

      assert_raises NotImplementedError do
        command.run
      end
    end
  end
end
