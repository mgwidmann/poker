defmodule Poker do
  use Application

  @moduledoc """
    A Poker CLI application which can be played over the network with other users
    of the same applicaiton. No server is necessary, all player's machines will
    cooperate to move the game along.
  """

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # Define workers and child supervisors to be supervised
      worker(Poker.Player, []),
      worker(Play.Chat, []),
      worker(Poker.Deck.Server, [])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Poker.Supervisor]
    Supervisor.start_link(children, opts)
  end

end
