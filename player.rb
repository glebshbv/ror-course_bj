require_relative 'accountable'

class Player
  include Accountable

  def initialize(name)
    @name = name
    @balance = 100
    @cards_on_hand = []
    validate!
  end

  def validate!
    raise NameIsNull if name.nil? || name.strip.empty?
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  def game_balance
    puts "Your current balance is $#{@balance}"
  end

  def game_hand_sum
    puts "Your hand points sum is #{adjust_for_ace(@cards_on_hand.reduce(0) {|sum, card| sum + card.value })}"
  end
end
