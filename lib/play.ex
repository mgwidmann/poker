defmodule Mix.Tasks.Play do
  use Mix.Task
  @help """
      List of all commands:
        /help                        -  Displays this list
        /help <comamnd>              -  Displays more helpful information about that command
        /join <node1> <node2> ...    -  Join an existing Poker node network
        /list                        -  List the names of all the players
        /quit                        -  Exit the game
    """
  @join """
      Specify the node name of another player on your network
      in the form of "name@iporhost.com". For example, if starting
      two Poker games on the same computer in different terminals,
      simply type the following:

      /join foo@127.0.0.1

      You can join multiple nodes by separating them by spaces like:

      /join foo@127.0.0.1 bar@127.0.0.1 baz@127.0.0.1

      Names of users (prefixing the @ sign) will always be lowercase!
    """

  def run(_) do
    Poker.start(:normal, [])
    name = IO.gets("Please enter your name: ") |> String.strip
    Poker.Player.name(name)
    :net_kernel.stop()
    :net_kernel.start([name |> String.downcase |> String.to_atom, :shortnames])
    Node.set_cookie(:poker)
    IO.puts "All commands start with a \"/\". To get the list of commands, type \"/?\" or \"/help\""
    command
  end

  def command do
    case IO.gets("#{node}> ") |> String.strip do
      "/" <> command ->
        [cmd | args] = String.split(command, " ")
        command(String.to_atom(cmd), args)
      chat -> chat(chat)
    end
    command
  end

  def command(:join, [node_name | remaining]) do
    IO.puts "Joining #{node_name}..."
    String.to_atom(node_name) |> Node.connect
    command(:join, remaining)
  end

  # Done joining, terminator function
  def command(:join, []), do: nil

  def command(:list, []) do
    Node.list |> Enum.each fn(n) ->
      IO.puts "#{n}"
    end
  end

  def command(:quit, []) do
    IO.puts "Thanks for playing!"
    System.halt(0)
  end

  def command(:help, []), do: IO.puts @help
  def command(:"?", []), do: IO.puts @help
  def command(:help, ["join"]), do: IO.puts @join

  def command(_command, _args) do
    IO.puts "I'm afraid I don't understand that command... Heres some help!"
    command(:help, [])
  end

  def chat(chat) do
    IO.puts "Sending to all players: #{chat}"
  end

end
