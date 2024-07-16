require_relative 'card_exists_error'
require_relative 'name_is_null'
require_relative 'player'
require_relative 'dealer'
require_relative 'card'
require_relative 'game'
require_relative 'program'

program = Program.new

program.start

puts "Player cards on hand #{program.player.cards_on_hand}"
puts "Dealer cards on hand #{program.dealer.cards_on_hand}"

# puts "Player's hand sum: #{program.player.hand_sum}"
# puts "Dealer's hand sum: #{program.dealer.hand_sum}"
#
# program.game.cards_played.each {|cc| puts cc.to_s}

# cards.each {|cc| puts cc.to_s}
