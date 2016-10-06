require_relative 'table'
require_relative 'robot'
require_relative './commands/place'
require_relative './commands/move'
require_relative './commands/left'
require_relative './commands/right'
require_relative './commands/report'
require_relative './commands/bad'

class Simulator
  attr_reader :robot

  def initialize
    table = Table.new
    @robot = Robot.new(table)
  end

  def execute(input)
    choose_command(input).new(@robot, STDOUT).run(input)
  end

  private

  def choose_command(input)
    case input
    when /^PLACE (\d),(\d),([A-Z]+)/
      Commands::Place
    when 'MOVE'
      Commands::Move
    when 'LEFT'
      Commands::Left
    when 'RIGHT'
      Commands::Right
    when 'REPORT'
      Commands::Report
    else
      Commands::Bad
    end
  end
end
