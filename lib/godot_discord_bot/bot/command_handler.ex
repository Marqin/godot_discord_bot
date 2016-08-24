defmodule GodotDiscordBot.Bot.CommandHandler do

  alias DiscordEx.RestClient.Resources.Channel

  def handle({"class", [class|_rest]}, data, state) do
      msg = "http://docs.godotengine.org/en/latest/classes/class_" <> String.downcase(class) <> ".html"
      Channel.send_message(state[:rest_client], data["channel_id"], %{content: msg})
  end

  def handle(_, _, _) do
    :noop
  end
end
