require_relative 'accountable'

class Dealer
  include Accountable

  def initialize(name = :Dealer)
    @name = name
    @balance = 100
    @cards_on_hand = []
  end

  def play
    puts "Dealer cards sum is: #{self.hand_sum}"
    make_decision
  end

  def make_decision
    loop do
      puts "Sum of cards: #{self.hand_sum}"
      puts "n of cards: #{@cards_on_hand.count}"
      skip_turn if self.hand_sum >= 17
      break if @cards_on_hand.count == 3
      @game.make_move(self)
    end
  end

  def skip_turn
    puts "I skipped turn"
  end
end
