defmodule Euchre.Deck do
  alias Euchre.Card
  def gen do
     [%Card{suit: :hearts, rank: 8},
      %Card{suit: :spades, rank: 8},
      %Card{suit: :clubs, rank: 8},
      %Card{suit: :diamonds, rank: 8},
      %Card{suit: :hearts, rank: 9},
      %Card{suit: :spades, rank: 9},
      %Card{suit: :clubs, rank: 9},
      %Card{suit: :diamonds, rank: 9},
      %Card{suit: :hearts, rank: 10},
      %Card{suit: :spades, rank: 10},
      %Card{suit: :clubs, rank: 10},
      %Card{suit: :diamonds, rank: 10},
      %Card{suit: :hearts, rank: 'Q'},
      %Card{suit: :spades, rank: 'Q'},
      %Card{suit: :clubs, rank: 'Q'},
      %Card{suit: :diamonds, rank: 'Q'},
      %Card{suit: :hearts, rank: 'K'},
      %Card{suit: :spades, rank: 'K'},
      %Card{suit: :clubs, rank: 'K'},
      %Card{suit: :diamonds, rank: 'K'},
      %Card{suit: :hearts, rank: 'A'},
      %Card{suit: :spades, rank: 'A'},
      %Card{suit: :clubs, rank: 'A'},
      %Card{suit: :diamonds, rank: 'A'},
      %Card{suit: :hearts, rank: 'J'},
      %Card{suit: :spades, rank: 'J'},
      %Card{suit: :clubs, rank: 'J'},
      %Card{suit: :diamonds, rank: 'J'}]
  end

  def init(deck)
    when is_list(deck)
  do
    deck
    |> Enum.shuffle
    |> Enum.slice(3, 28)
    |> turn
  end

  def get_top_card(deck)
    when is_list(deck)
  do
    [head| tail] = deck
    %{head: head, deck: tail}
  end

  defp turn(deck) do
      suit = Enum.take(deck, 1)
      {suit, deck}
  end
end
