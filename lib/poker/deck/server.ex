defmodule Poker.Deck.Server do
  use GenServer
  alias Poker.Deck

  @moduledoc """
    The deck server holds an instance of the deck and maintains manipulating its
    contents via using the `Poker.Deck` module.

    It was attempted to merge this module with the `Poker.Deck` module, but it was
    not succesful. Perhaps later it will get figured out.
  """

  def start_link do
    GenServer.start_link(__MODULE__, %Deck{}, name: :deck)
  end

  @doc """
    Get the current Deck instance across the entire node.
  """
  def deck do
    GenServer.call(:deck, :get)
  end

  def handle_call(:get, _from, deck) do
    {:reply, deck, deck}
  end

end
