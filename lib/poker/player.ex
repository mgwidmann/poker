defmodule Poker.Player do
  use GenServer

  @moduledoc """
    An erlang process representing the current player on each node. When each
    node starts up, the `mix play` command will prompt the user to set this value
    and it will stay that way throughout the game. A player's name is used for
    joining and identification purposes when chatting.
  """

  # Initialize and link setup functions for GenServer API
  def init(_) do
    Process.register(self, :player)
    {:ok, %{node_name: node(), name: nil}}
  end

  def start_link do
    GenServer.start_link(__MODULE__, :ok, [])
  end

  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok, [])
  end

  @doc """
    Get the local player's PID on the current node

      iex> Poker.Player.process
      #PID<0.78.0>
  """
  def process do
    Process.whereis(:player)
  end

  @doc """
    Get the player name of the supplied PID. This could be a player on another
    node if you have the PID of that remote process.
  """
  def name(pid) when is_pid(pid)  do
    GenServer.call(pid, :name)
  end

  @doc """
    Get the player name of the local player on the current node.
    Equivalent to `Poker.Player.process |> Poker.Player.name`
  """
  def name do
    process |> name
  end

  def handle_call(:name, _from, state) do
    {:reply, state.name, state}
  end

  @doc """
    Sets the local player's name

      iex> Poker.Player.name("Joe")
  """
  def name(name) when is_binary(name) do
    GenServer.cast(process, {:name, name})
  end

  def handle_cast({:name, name}, state) do
    {:noreply, %{state | name: name}}
  end

end
