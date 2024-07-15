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

end
