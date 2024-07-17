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

  def show_hand
    "#{@cards_on_hand.map { |card| "| #{card} |" }.join(" ")}"
  end

  def collect_win(amount)
    increase_balance(amount)
  end

  def adjust_for_draw
    @balance + 10
  end

  private

  def reduce_balance(amount)
    @balance -= amount
  end

  def increase_balance(amount)
    @balance += amount
  end

  def adjust_for_ace(sum)
    aces_count = @cards_on_hand.count { |card| card.is_ace? }
    if aces_count == 3
      sum = 13
    else
      while aces_count > 0 && sum > 21
        sum -= 10
        aces_count -= 1
      end
    end
    sum
  end
end
