# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :outlet_api,
  namespace: Bonus.OutletAPI,
  ecto_repos: []

# Configures the endpoint
config :outlet_api, Bonus.OutletAPI.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "I/lQCtw/aLKjUguBf3Rg7tT9c7UOYoS+rlX0co33FPs7S9S7q8EwzDyx+Taulvwv",
  render_errors: [view: Bonus.OutletAPI.Web.ErrorView, accepts: ~w(json)],
  pubsub: [name: Bonus.OutletAPI.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
