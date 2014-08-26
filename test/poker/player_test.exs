defmodule Poker.PlayerTest do
  use ExUnit.Case, async: true
  alias Poker.Player

  test "starts a player" do
    assert (Player.process |> Process.alive?) == true
  end

  test "can set the player's name" do
    assert Player.name("Joe") == :ok
  end

  test "can get the player's name" do
    Player.name("Joe")
    assert Player.name == "Joe"
  end

  test "can get the player's name on another node" do
    Player.name("Joe")
    assert (Player.process |> Player.name) == "Joe"
  end

end
