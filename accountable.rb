module Accountable
  attr_accessor :name, :balance
  attr_reader :cards_on_hand

  def balance
    @balance
  end

  def add_card_to_hand(card)
    @cards_on_hand << card
  end


end
