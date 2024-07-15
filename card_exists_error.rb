class CardExistsError < StandardError
  def initialize(msg = "Card already exists in the game")
    super
  end
end
