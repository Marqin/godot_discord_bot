defmodule GodotDiscordBot.Bot.CommandHandler do

  alias DiscordEx.RestClient.Resources.Channel

  def handle({"class", arg}, data, state) do
    [class|_rest] = String.split(arg)
    msg = "http://docs.godotengine.org/en/latest/classes/class_" <> String.downcase(class) <> ".html"
    Channel.send_message(state[:rest_client], data["channel_id"], %{content: URI.encode(msg)})
  end

  def handle({"docs", query}, data, state) do
    msg = "http://docs.godotengine.org/en/latest/search.html?q=" <> query
    Channel.send_message(state[:rest_client], data["channel_id"], %{content: URI.encode(msg)})
  end

  def handle({"info", _}, data, state) do
    info =
"""
```haskell
GodotBot made by Marqin
bot_code: https://github.com/marqin/godot_discord_bot/
discord_library: https://github.com/rmcafee/discord_ex/
```
"""
    Channel.send_message(state[:rest_client], data["channel_id"], %{content: info})
  end

  def handle({"help", _}, data, state) do
    info =
"""
```xl
Commands:
help - this message
info - basic info about this bot
class CLASS_NAME - link to Godot class reference for CLASS_NAME
docs PHRASE TO SEARCH - link to Godot docs search for "PHRASE TO SEARCH"
```
"""
    Channel.send_message(state[:rest_client], data["channel_id"], %{content: info})
  end

  def handle(_, _, _) do
    :noop
  end
end
