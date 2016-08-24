defmodule GodotDiscordBot.Worker do
  require Logger

  def start_link(opts \\ []) do
    DiscordEx.Client.start_link(opts)
  end

  def handle_event({:message_create, payload}, state) do
    # ignore messages from bots
    if ! payload.data["author"]["bot"] do
      Task.start fn -> GodotDiscordBot.Bot.handle_message(payload, state) end
    end
    {:ok, state}
  end

  def handle_event({_event, _payload}, state) do
    {:ok, state}
  end

end
