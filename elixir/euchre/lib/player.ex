defmodule Euchre.Player do
  use GenServer

  def init(hand) do
    {:ok, hand}
  end

  def start_link(name) do
    GenServer.start_link(__MODULE__, [])
  end

  def deal_card(pid, card) do
    GenServer.cast(pid, {:deal_card, card})
  end

end
