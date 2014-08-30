defmodule Poker.Deck.CardTest do
  use ExUnit.Case, async: true
  alias Poker.Deck.Card
  require Poker.Deck.Constants
  alias Poker.Deck.Constants, as: Conf

  test "displaying an unknown card" do
    assert Card.display(%Card{suit: :ace, value: :spades}) == "Unknown spades of ace"
  end

  test "displaying a spade" do
    Conf.values |> Enum.each fn(v) ->
      len = (Atom.to_string(v) |> String.length) * 8
      assert <<_upcase_value::size(len), Conf.spade>> = Card.display(%Card{value: v, suit: :spades})
    end
  end
  test "displaying a heart" do
    Conf.values |> Enum.each fn(v) ->
      len = (Atom.to_string(v) |> String.length) * 8
      assert <<_upcase_value::size(len), Conf.heart>> = Card.display(%Card{value: v, suit: :hearts})
    end
  end
  test "displaying a diamond" do
    Conf.values |> Enum.each fn(v) ->
      len = (Atom.to_string(v) |> String.length) * 8
      assert <<_upcase_value::size(len), Conf.diamond>> = Card.display(%Card{value: v, suit: :diamonds})
    end
  end
  test "displaying a club" do
    Conf.values |> Enum.each fn(v) ->
      len = (Atom.to_string(v) |> String.length) * 8
      assert <<_upcase_value::size(len), Conf.club>> = Card.display(%Card{value: v, suit: :clubs})
    end
  end
end
