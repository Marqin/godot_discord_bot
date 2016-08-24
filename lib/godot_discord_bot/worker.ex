defmodule GodotDiscordBot.Worker do
  require Logger

  def start_link(opts \\ []) do
    DiscordEx.Client.start_link(opts)
  end

  def handle_event({:message_create, payload}, state) do
    Task.start fn -> GodotDiscordBot.Bot.handle_message(payload, state) end
    {:ok, state}
  end

  def handle_event({_event, _payload}, state) do
    {:ok, state}
  end

end
