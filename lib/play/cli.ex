defmodule Play.CLI do
  import Play.Constants
  alias Play.Chat
  alias Poker.Player

  def command do
    case IO.gets("#{node}> ") |> String.strip do
      "/" <> command ->
        [cmd | args] = String.split(command, " ")
        command(String.to_atom(cmd), args)
      chat -> Chat.broadcast(chat)
    end
    command
  end

  def command(:join, [node_name | remaining]) do
    IO.puts "Joining #{node_name}..."
    unless (String.to_atom(node_name) |> Node.connect) do
      IO.puts "Unable to join #{node_name}, cannot connect to host!"
    end
    command(:join, remaining)
  end

  # Done joining, terminator function
  def command(:join, []), do: true

  def command(:list, []) do
    Node.list |> Enum.each fn(n) ->
      IO.puts "#{n}"
    end
  end

  def command(:help, []), do: IO.puts help
  def command(:"?", []), do: IO.puts help
  def command(:help, ["join"]), do: IO.puts join

  def command(_command, _args) do
    IO.puts do_not_understand
    command(:help, [])
  end

end
