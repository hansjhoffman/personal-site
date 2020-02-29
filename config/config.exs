use Mix.Config

config :shenanigans, ShenanigansWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vilmMnlmwmr1OfpbaSxcpDN/IMgEIfwMZ09FOGboKJUa3hXXWZl1NRX1sGOUut+J",
  render_errors: [view: ShenanigansWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Shenanigans.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "eGQ/g+7t"]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
