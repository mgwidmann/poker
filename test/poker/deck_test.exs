defmodule Poker.DeckTest do
  use ExUnit.Case, async: true
  alias Poker.Deck
  alias Poker.Deck.Server

  test "creates a new deck" do
    assert (Deck.new |> Enum.count) == 52
  end

  # Really low chance that these two collide, run again if they do...
  test "creates a shuffled deck" do
    assert (Deck.new |> List.first) != (Deck.new |> List.first)
  end

  test "creates a deck with all unique cards" do
    deck = Deck.new # Only want to create it once
    deck |> Enum.each fn(card) ->
      assert Enum.count(deck, fn(other_card)->
        card == other_card
      end) == 1
    end
  end

  test "has 13 cards of each suit" do
    suit_map = [clubs: 0, diamonds: 0, hearts: 0, spades: 0]
    suits = Deck.new |> Enum.reduce suit_map, fn(card, map)->
      Keyword.put(map, card.suit, Keyword.get(map, card.suit) + 1)
    end
    suits = suits |> Enum.sort
    assert suits == [clubs: 13, diamonds: 13, hearts: 13, spades: 13]
  end

  test "has four of each value" do
    value_map = [a: 0, "2": 0, "3": 0, "4": 0, "5": 0, "6": 0, "7": 0, "8": 0, "9": 0, "10": 0, j: 0, q: 0, k: 0]
    values = Deck.new |> Enum.reduce value_map, fn(card, map)->
      Keyword.put(map, card.value, Keyword.get(map, card.value) + 1)
    end
    values = values |> Enum.sort
    assert values == ["10": 4, "2": 4, "3": 4, "4": 4, "5": 4, "6": 4, "7": 4, "8": 4, "9": 4, a: 4, j: 4, k: 4, q: 4]
  end

  test "deck server starts up" do
    assert %Deck{deck: _deck, used: [], in_hand: []} = Server.deck
  end

end
