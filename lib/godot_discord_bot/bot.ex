defmodule GodotDiscordBot.Bot do

  alias DiscordEx.Client.Helpers.MessageHelper

  def handle_message(payload, state) do
    parsed_cmd = MessageHelper.msg_command_parse(payload, ".")
    GodotDiscordBot.Bot.CommandHandler.handle(parsed_cmd, payload.data, state)
  end

end
