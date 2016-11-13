defmodule Poker.Mixfile do
  use Mix.Project

  def project do
    [app: :poker,
     version: "0.0.1",
     elixir: "~> 1.0",
     source_url: "https://github.com/mgwidmann/poker",
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [],
     mod: {Poker, []}]
  end

  # Dependencies can be hex.pm packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:earmark, "~> 1.0"}
    ]
  end
end
