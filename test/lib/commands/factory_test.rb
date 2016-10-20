require_relative '../../test_helper'

module Commands
  class FactoryTest < Minitest::Test
    def test_build
      assert_equal Commands::Place,  Commands::Factory.build('PLACE 1,2,EAST')
      assert_equal Commands::Move,   Commands::Factory.build('MOVE')
      assert_equal Commands::Back,   Commands::Factory.build('BACK')
      assert_equal Commands::Turn,   Commands::Factory.build('LEFT')
      assert_equal Commands::Turn,   Commands::Factory.build('RIGHT')
      assert_equal Commands::Turn,   Commands::Factory.build('AROUND')
      assert_equal Commands::Report, Commands::Factory.build('REPORT')
      assert_equal Commands::Bad,    Commands::Factory.build('BAD')
    end
  end
end
