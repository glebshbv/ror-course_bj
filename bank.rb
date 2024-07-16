class Bank
  attr_reader :game, :player, :dealer, :balance

  def initialize(player, dealer, game)
    @games_played = []
    @player = player
    @dealer = dealer
    @game = game
    @balance = 0
  end

  def add_balance(amount)
    @balance += amount
  end

  def remove_balance(amount)
    @balance -= amount
  end

end
