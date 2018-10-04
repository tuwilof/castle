defmodule Castle.MixProject do
  use Mix.Project

  def project do
    [
      app: :castle,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      applications: [:logger, :cowboy, :plug]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  def deps do
    [
      {:cowboy, "~> 2.0"},
      {:plug, "~> 1.0"}
    ]
  end
end
