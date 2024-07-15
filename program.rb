class Program

  def initialize
    @player = nil
    @dealer = nil
  end

  def start
    create_player
    puts "Player #{@player.name} with balance #{@player.balance} is ready"
    create_dealer
    puts "Dealer #{@dealer.name} with balance #{@dealer.balance} is ready"
  end

  def create_player
    @player = Player.new(:Gleb)
  end

  def create_dealer
    @dealer = Dealer.new
  end
end
