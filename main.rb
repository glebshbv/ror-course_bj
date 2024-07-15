require_relative 'card_exists_error'
require_relative 'player'
require_relative 'dealer'
require_relative 'card'
require_relative 'program'

program = Program.new

program.start

puts "Player cards on hand #{program.player.cards_on_hand}"
puts "Dealer cards on hand #{program.dealer.cards_on_hand}"


# cards = program.cards_in_game

# cards.each {|cc| puts cc.to_s}
