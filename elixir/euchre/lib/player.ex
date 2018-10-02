defmodule Euchre.Player do
  use GenServer
  
  alias Euchre.PlayerState

  def init(%PlayerState{} = initial_state) do
    {:ok, initial_state}
  end

  def start_link(name) do
    GenServer.start_link(__MODULE__, %PlayerState{}, name: name)
  end


  def join_game(server, game_pid) do
    
  end
end
                             
