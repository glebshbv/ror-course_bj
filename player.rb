require_relative 'accountable'

class Player
  include Accountable

  def initialize(name)
    @name = name
    @balance = 100
    @cards_on_hand = []
  end

end
