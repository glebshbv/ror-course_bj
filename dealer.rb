require_relative 'accountable'

class Dealer
  include Accountable

  def initialize(name = :Dealer)
    @balance = 100
    @name= name
    @cards_on_hand = []
  end

end
