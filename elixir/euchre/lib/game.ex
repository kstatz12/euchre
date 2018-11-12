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
    r_bower = for R <- cards, do card.suit = trump, card.rank = 11 end
    l_bower = for L <- cards, do card.suit = reciprocating_trumo(trump), card.rank = 11 end
    sorted_trump = cards
    |> Enum.filter(fn x -> x.rank != 11 end)
    |> Enum.filter(fn x -> x.suit = trump end)
    |> Enum.sort(fn(l,r) -> l.rank > r.rank end)
    sorted_non_trump = cards
    |> Enum.filter(fn x -> x.suit != trump end)
    |> Enum.sort(fn l, r -> l.rank > r.rank end)
    r_bower ++ l_bower ++ sorted_trump ++ sorted_non_trump
  end

  # this is kind of shit, refactor
  def reciprocating_trump(:hearts) do
    :diamonds
  end

  def reciprocating_trump(:diamonsd) do
    :hearts
  end

  def reciprocating_trump(:spades) do
    :clubs
  end

  def reciprocating_trump(:clubs) do
    :spades
  end

end
