# helpers/deck.rb

class Deck
  # attr_reader :deck
  SUITS = %w{Spades Diamonds Hearts Clubs}
  RANKS = (2..10).to_a + %w{Jack King Queen Ace}

  def initialize
    @deck = SUITS.product(RANKS).shuffle
  end

  def size
    @deck.length
  end

  def deal
    # deal four cards from deck
    # four cards are removed from deck
    [deal_one_card, deal_one_card]
  end

  def deal_one_card
    # deal one card from top deck
    # deal removes card from deck (think pop)
    @deck.pop unless empty?
  end

  private

  def empty?
    @deck.empty?
  end

  # def suits
  #   %w{Spades Diamonds Hearts Clubs}
  # end
  #
  # def ranks
  #   (2..10).to_a + %w{Jack King Queen Ace}
  # end

end
