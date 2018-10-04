defmodule Euchre.Hand do
  alias Euchre.Card

  def add(%Card{} = card, hand)
  when is_list(hand) do
    hand ++ [card]
    |> rank
  end

  def play(hand) do
    when is_list(hand)
    [head | tail] = hand
    head
  end

  def rank(hand)
    when is_list(hand) do
    hand
  end
end
