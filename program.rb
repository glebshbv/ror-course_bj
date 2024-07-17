

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
    game.setup_game
    game.start_game
  end

  private

  def prepare_players
    create_player
    create_dealer
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
