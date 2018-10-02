defmodule Euchre.Game do
  use GenServer


  alias Euchre.Deck
  alias Euchre.GameState
  alias Euchre.Player

  ## Server Setup
  def init(%Gastate) do
    {:ok, state}
  end


  def start_link() do
    GenServer.start_link(__MODULE__, Deck.gen)
  end


  ## Client
  def add_player(pid, player) do
    GenServer.cast(pid, {:add_player, player_name})
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

  ## Logic
  # TODO move this to its own module
  defp start_game(deck)
    when is_list(deck)
  do
    deck
    |> Enum.shuffle
    |> Enum.slice(4, 28)
    |> turn
  end

  defp turn(deck) do
    suit = Enum.take(deck, 1)
    {suit, deck}
  end

end
