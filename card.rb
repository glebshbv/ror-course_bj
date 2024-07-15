class Card
  attr_reader :suit, :rank

  SUITS = ['♥', '♦', '♣', '♠']
  RANKS = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace]

  def initialize(suit, rank)
    raise "Invalid suit" unless SUITS.include?(suit)
    raise "Invalid rank" unless RANKS.include?(rank)
    @suit = suit
    @rank = rank
  end

  def to_s
    "#{@rank} #{@suit}"
  end

  def value
    return 11 if self.is_ace?
    return 10 if self.is_face_card?
    return @rank.to_i
  end

  private

  def is_ace?
    @rank == 'Ace'
  end

  def is_face_card?
    %w[Jack Queen King].include?(@rank)
  end

end
