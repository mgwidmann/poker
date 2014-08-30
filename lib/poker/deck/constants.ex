defmodule Poker.Deck.Constants do
  use Poker.Constants

  # All possible deck values prior to list comprehension
  define values, [:a, :"2", :"3", :"4", :"5", :"6", :"7", :"8", :"9", :"10", :j, :q, :k]
  define suits, [:spades, :clubs, :diamonds, :hearts]

  # Unicode displays for each suit type
  define spade, "\x{2664}"
  define heart, "\x{2661}"
  define diamond, "\x{2662}"
  define club, "\x{2667}"

end
