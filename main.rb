require_relative 'card_exists_error'
require_relative 'name_is_null'
require_relative 'player'
require_relative 'dealer'
require_relative 'card'
require_relative 'bank'
require_relative 'game'
require_relative 'program'

program = Program.new

program.start

# puts "Player cards on hand #{program.player.cards_on_hand}"
# puts "Dealer cards on hand #{program.dealer.cards_on_hand}"
# puts program.game.bank

puts "Player's balance: #{program.player.balance}"
puts "Dealer's balance: #{program.dealer.balance}"
puts "Bank balance: #{program.game.bank.balance}"
#
# program.game.cards_played.each {|cc| puts cc.to_s}

# cards.each {|cc| puts cc.to_s}
