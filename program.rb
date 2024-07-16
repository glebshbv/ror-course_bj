

class Program

attr_reader :player, :dealer, :game

  def initialize
    @player = nil
    @dealer = nil
    @game = nil
  end

  def start
    prepare_players
    @game = Game.new(@player, @dealer)
    game.bank = prepare_bank
    game.setup_game
    game.start_game
    #method to finish game
  end

  private

  def prepare_players
    create_player
    # puts "Player #{@player.name} with balance #{@player.balance} is ready"
    create_dealer
    # puts "Dealer #{@dealer.name} with balance #{@dealer.balance} is ready"
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
    # puts "Please enter your name"
    # make_choice
    "Debug Player"
  end

  def prepare_bank
    Bank.new(player, dealer, game)
  end

end
