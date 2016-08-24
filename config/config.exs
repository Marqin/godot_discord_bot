use Mix.Config

config :porcelain, goon_warn_if_missing: false

config :godot_discord_bot, token: System.get_env("GODOT_DISCORD_BOT_TOKEN")

# you can also config :token in gitignored "secret.exs"
# import_config "secret.exs"
