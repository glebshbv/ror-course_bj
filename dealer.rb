require_relative 'accountable'

class Dealer
  include Accountable

  def initialize(name = :Dealer)
    @balance = 100
    @name= name
  end

end
