#!/usr/bin/env ruby

require_relative '../lib/simulator'

prompt = '> '
puts "Initialize the simulator"

simulator = Simulator.new

puts "Please input the 'PLACE' command to start and 'quit' to exit."
print prompt

while input = STDIN.gets.chomp
  if input == "quit"
    break
  end

  begin
    simulator.execute input
  rescue => e
    puts e.message
  end
  print prompt
end

puts "Good bye!"
