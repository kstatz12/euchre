defmodule Euchre.Rules do


  def init(deck)
    when is_list(deck)
  do
    deck
    |> Enum.shuffl
    |> burn
    |> turn
  end

  defp burn(deck) do
    deck |> Enum.slice(3, 28)
  end

  defp turn(deck) do
    suit = Enum.take(deck, 1)
    {suit, deck}
  end
end
