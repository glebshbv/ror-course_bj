class Game
  attr_accessor :bank
  attr_reader :player, :dealer, :cards_in_game, :cards_played, :game_id

  def initialize(player, dealer)
    @player = player
    @dealer = dealer
    @cards_in_game = []
    @cards_played = []
    @game_id = generate_game_id
  end

  def setup_game
    @player.game = self
    @dealer.game = self
    create_deck
    [@player, @dealer].each {|u| make_first_bet(u)}
    release_initial_hand
  end

  def start_game
    # показать сумму очков
    #дать выбор пропустить, добавить карту, открыть карту
    #дилер делает ход
    @dealer.play
  end

  def make_first_bet(user)
    user.place_starting_bet
    @bank.add_balance(10)
  end

  def make_move(player)
    deal_card(player)
  end

  private

  def generate_game_id
    chars = ('A'..'Z').to_a + ('0'..'9').to_a
    "#{chars.sample(3).join}-#{chars.sample(2).join}"
  end

  def create_deck
    Card::SUITS.each do |suit|
      Card::RANKS.each do |rank|
        @cards_in_game << Card.new(suit, rank)
      end
    end
  end

  def release_initial_hand
    2.times do
      deal_card(@player)
      deal_card(@dealer)
    end
  end

  def deal_card(player)
    card = @cards_in_game.sample
    remove_card_from_deck(card)
    player.add_card_to_hand(card)
    puts "Dealt #{card.to_s} to #{player.name}"
  end

  def remove_card_from_deck(card)
    @cards_in_game.delete(card)
    @cards_played << card
  end

end
