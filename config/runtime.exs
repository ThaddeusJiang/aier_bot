import Config

config :aier_bot, :telegram_bot_token, System.fetch_env!("TELEGRAM_BOT_TOKEN")
