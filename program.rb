class Program

  def initialize
    @player = nil
    @dealer = nil
  end

  def start
    initiate_game
  end

  def initiate_game
    create_player
    puts "Player #{@player.name} with balance #{@player.balance} is ready"
    create_dealer
    puts "Dealer #{@dealer.name} with balance #{@dealer.balance} is ready"
  end

  def create_player
    @player = Player.new(prepare_player)
  end

  def create_dealer
    @dealer = Dealer.new
  end

  def make_choice
    gets.chomp
  end

  def prepare_player
    puts "Please enter your name"
    make_choice
  end

end
