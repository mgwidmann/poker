defmodule Poker.Deck do
  require Poker.Deck.Constants
  alias Poker.Deck.Constants, as: Const
  alias Poker.Deck.Card

  @moduledoc """
    Struct representing a Deck of cards used during gameplay. The deck keeps track
    of which cards are available to be drawn from and which have already been used.
    Additionally, it keeps track of the cards which are in player's hands (though it
    doesn't keep track of which players have which cards).

    Creating a blank Deck struct like `%Poker.Deck{}` will by default have a `:deck`
    field which is filled in with the full card contents already shuffled (via the `new`
    call).
  """

  @doc """
    Creates a newly shuffled Deck. The deck only consists of a list
    of cards contained in a typical deck of cards.
    A, 2, 3, 4, 5, 6, 7, 8, 9, 10, J, Q, K
  """
  def new do
    (for x <- Const.values, y <- Const.suits, do: %Card{value: x, suit: y})
    |> Enum.shuffle
  end

  # Manual struct definition to allow running Deck.new inside the deck field
  def __struct__(_args) do
    %{__struct__: __MODULE__, deck: __MODULE__.new(), used: [], in_hand: []}
  end

end
