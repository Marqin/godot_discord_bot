defmodule GodotDiscordBot.Bot do

  alias DiscordEx.Client.Helpers.MessageHelper

  def handle_message(payload, state) do
    prefix = Application.get_env(:godot_discord_bot, :cmd_prefix)
    parsed_cmd = MessageHelper.msg_command_parse(payload, prefix)
    GodotDiscordBot.Bot.CommandHandler.handle(parsed_cmd, payload.data, state)
  end

end
