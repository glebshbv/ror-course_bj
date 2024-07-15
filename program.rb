

class Program

  def initialize
    @player = nil
    @dealer = nil
    @cards_in_game = []
    @cards_played = []
  end

  def start
    initiate_game
  end

  def initiate_game
    create_player
    puts "Player #{@player.name} with balance #{@player.balance} is ready"
    create_dealer
    puts "Dealer #{@dealer.name} with balance #{@dealer.balance} is ready"
    create_deck
    puts "Deck has been created."
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

  def create_deck
    Card::SUITS.each do |suit|
      Card::RANKS.each do |rank|
        @cards_in_game << Card.new(suit, rank)
      end
    end
  end

  def cards_in_game
    @cards_in_game
  end

end
