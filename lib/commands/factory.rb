require_relative 'place'
require_relative 'move'
require_relative 'left'
require_relative 'right'
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
end
