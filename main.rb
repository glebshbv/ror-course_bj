require_relative 'player'
require_relative 'dealer'
require_relative 'program'

program = Program.new

program.start

puts program.inspect
