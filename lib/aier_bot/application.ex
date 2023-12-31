defmodule AierBot.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ExGram,
      {AierBot.Bot,
       [method: :polling, token: Application.fetch_env!(:aier_bot, :telegram_bot_token)]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AierBot.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
