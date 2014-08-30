defmodule Poker.Deck.Card do
  defstruct suit: nil, value: nil
  require Poker.Deck.Constants
  alias Poker.Deck.Constants, as: Conf

  @moduledoc """
    A struct representing the data to hold an individual card as well as helper
    functions for using the cards, such as displaying them.
  """

  @doc """
    Returns the print representation of a particular card.
    List of all cards:

        A♤ 2♤ 3♤ 4♤ 5♤ 6♤ 7♤ 8♤ 9♤ 10♤ J♤ Q♤ K♤
      A♢ 2♢ 3♢ 4♢ 5♢ 6♢ 7♢ 8♢ 9♢ 10♢ J♢ Q♢ K♢
      A♡ 2♡ 3♡ 4♡ 5♡ 6♡ 7♡ 8♡ 9♡ 10♡ J♡ Q♡ K♡
      A♧ 2♧ 3♧ 4♧ 5♧ 6♧ 7♧ 8♧ 9♧ 10♧ J♧ Q♧ K♧
  """
  def display(%__MODULE__{suit: :spades, value: value}) do
    "#{value |> Atom.to_string |> String.upcase}#{Conf.spade}"
  end
  def display(%__MODULE__{suit: :diamonds, value: value}) do
    "#{value |> Atom.to_string |> String.upcase}#{Conf.diamond}"
  end
  def display(%__MODULE__{suit: :hearts, value: value}) do
    "#{value |> Atom.to_string |> String.upcase}#{Conf.heart}"
  end
  def display(%__MODULE__{suit: :clubs, value: value}) do
    "#{value |> Atom.to_string |> String.upcase}#{Conf.club}"
  end
  def display(%__MODULE__{suit: suit, value: value}), do: "Unknown #{value} of #{suit}"

end
