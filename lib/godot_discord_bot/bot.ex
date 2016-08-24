defmodule GodotDiscordBot.Bot do

  alias DiscordEx.Client.Helpers.MessageHelper

  def handle_message(payload, state) do
    if MessageHelper.actionable_message_for_me?(payload, state) do
      tokens = String.split(payload.data["content"])

      if length(tokens) >= 2 do
        [cmd|args] = tl tokens
        GodotDiscordBot.Bot.CommandHandler.handle({cmd, args}, payload.data, state)
      end
    end
  end

end
