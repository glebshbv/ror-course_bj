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
    @bank = prepare_bank
    create_deck
    [@player, @dealer].each {|u| make_first_bet(u)}
    start_game
  end

  def start_game
    release_initial_hand
    loop do
      reveal_player_position
      show_menu
      choice = make_choice
      take_action(choice.to_i)
      break if @player.cards_on_hand.count == 3 || @dealer.cards_on_hand.count == 3
    end
    reveal_cards
    calculate_results
    play_again
  end

  def make_first_bet(user)
    user.place_starting_bet
    @bank.add_balance(10)
  end

  def make_move(player)
    deal_card(player)
  end

  private

  def reveal_player_position
    @player.game_balance
    @player.show_hand
    @player.game_hand_sum
  end

  def show_menu
    puts 'Please make your move. (1) Check (2) Add Card (3) Flop Cards'
  end

  def make_choice
    gets.chomp
  end

  def take_action(choice)
    case choice
    when 1
      check_turn
    when 2
      deal_card(player)
    when 3
      reveal_cards
      calculate_results
      play_again
      return
    end
  end

  def reveal_cards
    puts "======================"
    puts @player.show_hand
    puts "Player's hand sum: #{@player.hand_sum}"
    puts "======================"
    puts @dealer.show_hand
    puts "Dealer's hand sum: #{@dealer.hand_sum}"
    puts "======================"
  end

  def calculate_results
    player_sum = @player.hand_sum
    dealer_sum = @dealer.hand_sum

    if player_sum > 21
      puts "Player busted! Dealer wins."
      bank.release_winning(@dealer)
    elsif dealer_sum > 21
      puts "Dealer busted! Player wins."
      bank.release_winning(@player)
    elsif player_sum > dealer_sum
      puts "Player wins!"
      bank.release_winning(@player)
    elsif dealer_sum > player_sum
      puts "Dealer wins!"
      bank.release_winning(@dealer)
    else
      puts "It's a tie! Money is returned."
      @player.adjust_for_draw
      @dealer.adjust_for_draw
      @bank.return_all_money
    end

    @bank = 0
  end

  def play_again
    puts "Do you want to play again? (y/n)"
    choice = gets.chomp.downcase
    if choice == 'y'
      reset_game
      setup_game
    else
      puts "Thank you for playing!"
      exit
    end
  end

  def reset_game
    @cards_in_game = []
    @cards_played = []
    @player.cards_on_hand.clear
    @dealer.cards_on_hand.clear
  end

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
    return (puts "You reached maximum cards!!") if player.cards_on_hand.count >= 3
    card = @cards_in_game.sample
    remove_card_from_deck(card)
    player.add_card_to_hand(card)
  end

  def check_above_21_balance(player)
    player.hand_sum > 21
  end

  def check_turn
    puts @dealer.play
  end

  def remove_card_from_deck(card)
    @cards_in_game.delete(card)
    @cards_played << card
  end

  def prepare_bank
    Bank.new(player, dealer, self)
  end
end
