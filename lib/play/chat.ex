defmodule Play.Chat do
  use GenServer
  alias Poker.Player

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: :chat)
  end

  def broadcast(msg) do
    GenServer.multi_call(Node.list, :chat, {:message, Player.name, msg})
  end

  def handle_call({:message, name, msg}, _from, state) do
    IO.puts "#{name}: #{msg}"
    {:reply, nil, state}
  end

end
