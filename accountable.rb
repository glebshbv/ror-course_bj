module Accountable
  attr_accessor :name, :balance, :game
  attr_reader :cards_on_hand, :hand_sum


  def add_card_to_hand(card)
    @cards_on_hand << card
  end

  def hand_sum
    adjust_for_ace(@cards_on_hand.reduce(0) {|sum, card| sum + card.value })
  end

  def place_starting_bet
    reduce_balance(10)
  end

  private

  def reduce_balance(amount)
    @balance -= amount
  end

  def increase_balance(amount)
    @balance += amount
  end

  def adjust_for_ace(sum)
    @cards_on_hand.count { |card| card.is_ace? }.times do
      sum -= 10 if sum > 21
    end
    sum
  end

end
