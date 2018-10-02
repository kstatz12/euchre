defmodule Euchre.Game do
  use GenServer

  alias Euchre.GameState
  alias Euchre.Deck

  def init(%GameState{} = state)

  def start_game(server, []) do
    Deck.gen
  end
end
