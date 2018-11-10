defmodule Euchre.Game do

  alias Euchre.Deck
  def get_deck() do
    Deck.init()
  end

  def deal_one(deck) do
    [H | T] = deck
    %{card: H, deck: T}
  end

  def deal_two(deck) do
    [A, B | T] = deck
    %{card_a: A, card_b: B, deck: T}
  end


  def rank(cards, trump) do
    RBower = for R <- cards, do card.suit = trump, card.rank = 11 end
    LBower = for L <- cards, do card.suit != trump, card.rank = 11 end
  end

end
