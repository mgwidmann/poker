defmodule Mix.Tasks.Play do
  use Mix.Task
  import Play.CLI

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

end
