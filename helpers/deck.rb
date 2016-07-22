# helpers/deck.rb

class Deck

  def self.deck
    suits.product(ranks).shuffle
  end

  private

  def self.suits
    %w{Spades Diamonds Hearts Clubs}
  end

  def self.ranks
    (2..10).to_a + %w{Jack King Queen Ace}
  end

end

