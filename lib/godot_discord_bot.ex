defmodule GodotDiscordBot do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(GodotDiscordBot.Worker, [%{
        handler: GodotDiscordBot.Worker,
        token: Application.get_env(:godot_discord_bot, :token)
      }]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GodotDiscordBot.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
