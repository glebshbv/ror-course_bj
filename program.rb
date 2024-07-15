

class Program

attr_reader :player, :dealer

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
    release_initial_hand
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

  def release_initial_hand
    2.times do
      deal_card(@player, @cards_in_game.sample)
      deal_card(@dealer, @cards_in_game.sample)
    end
  end

  def deal_card(player, card)
    remove_card_from_deck(card)
    player.add_card_to_hand(card)
    puts "Dealt #{card.to_s} to #{player.name}"
  end

  def remove_card_from_deck(card)
    @cards_in_game.delete(card)
    @cards_played << card
  end
end
