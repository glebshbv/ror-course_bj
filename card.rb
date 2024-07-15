class Card
  attr_reader :suit, :rank

  SUITS = %w[Hearts Diamonds Clubs Spades]
  RANKS = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace]

  def initialize(suit, rank)
    raise "Invalid suit" unless SUITS.include?(suit)
    raise "Invalid rank" unless RANKS.include?(rank)
    @suit = suit
    @rank = rank
  end

  def to_s
    "#{@rank} of #{@suit}"
  end

end
