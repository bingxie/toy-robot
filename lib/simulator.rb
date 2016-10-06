require_relative 'table'
require_relative 'robot'
require_relative './commands/factory'

class Simulator
  attr_reader :robot

  def initialize(io = STDOUT)
    table = Table.new
    @robot = Robot.new(table)
    @io = io
  end

  def execute(input)
    command_class = Commands::Factory.build(input)
    command_class.new(@robot, @io).run(input)
  end
end
