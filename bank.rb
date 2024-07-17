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

  def return_all_money
    @balance -= 20
  end

  def release_winning(winner)
    @games_played << game
    winner.collect_win(balance)
    @balance = 0
  end
end
