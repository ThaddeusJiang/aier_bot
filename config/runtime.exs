import Config

config :aier_bot, :telegram_bot_token, System.fetch_env!("TELEGRAM_BOT_TOKEN")
config :aier_bot, :aier_api_token, System.fetch_env!("AIER_API_TOKEN")
