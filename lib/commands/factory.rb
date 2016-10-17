require_relative 'place'
require_relative 'move'
require_relative 'turn'
require_relative 'back'
require_relative 'report'
require_relative 'bad'

module Commands
  class Factory
    def self.build(input)
      case input
      when /^PLACE (\d),(\d),([A-Z]+)/
        Commands::Place
      when 'MOVE'
        Commands::Move
      when 'BACK'
        Commands::Back
      when 'LEFT', 'RIGHT', 'AROUND'
        Commands::Turn
      when 'REPORT'
        Commands::Report
      else
        Commands::Bad
      end
    end
  end
end
