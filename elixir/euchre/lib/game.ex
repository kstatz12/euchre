defmodule Euchre.Game do
  use GenServer


  alias Euchre.Deck
  alias Euchre.GameState
  alias Euchre.Player

  ## Server Setup
  def init(%GameState{} = state) do
    {:ok, state}
  end


  def start_link() do
    GenServer.start_link(__MODULE__, Deck.gen)
  end


  ## Client
  def start_game(pid) do
    GenServer.cast(pid, :start_game)
  end

end
