defmodule GodotDiscordBot.Mixfile do
  use Mix.Project

  def project do
    [app: :godot_discord_bot,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [applications: [:discord_ex, :logger],
     mod: {GodotDiscordBot, []}]
  end

  defp deps do
    #[{:discord_ex, "~> 1.1.4"}]  # wait for PR to be merged
    [{:discord_ex, git: "https://github.com/Marqin/discord_ex.git", ref: "cf6b5a95a87d21a5dd3c6550df94e4b8960b4be9"}]
  end
end
