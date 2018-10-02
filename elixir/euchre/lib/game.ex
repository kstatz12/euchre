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
  def add_player(pid, player) do
    GenServer.cast(pid, {:add_player, player})
  end

  def start_game(pid) do
    GenServer.cast(pid, :start_game)
  end

  ## Server
  def handle_cast({:add_player, player_name}, state) do
    {:ok, pid} = Player.start_link(player_name)
    ## TODO this is kind of messy
    p = state.players
    %{state | players: p ++ [{player_name, pid}]}
    {:noreply, state}
  end
end
