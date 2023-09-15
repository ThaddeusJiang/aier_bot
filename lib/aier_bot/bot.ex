defmodule AierBot.Bot do
  alias AierBot.AierApi
  @bot :aier_bot

  use ExGram.Bot,
    name: @bot,
    setup_commands: true

  command("start")
  command("help", description: "Print the bot's help")

  middleware(ExGram.Middleware.IgnoreUsername)

  def bot(), do: @bot

  def handle({:command, :start, _msg}, context) do
    answer(context, "Hi!")
  end

  def handle({:command, :help, _msg}, context) do
    answer(context, "Here is your help:")
  end

  def handle({:text, text, _msg}, context) do
    case AierApi.create_memo(text) do
      {:ok, response} -> create_memo_success(response, context)
      {:error, error} -> answer(context, "Error: #{inspect(error)}")
    end
  end

  def create_memo_success(_, context) do
    answer(context, "Memo saved!")
  end
end
