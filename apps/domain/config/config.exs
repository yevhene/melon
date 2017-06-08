use Mix.Config

# General application configuration
config :domain,
  namespace: Melon.Domain,
  ecto_repos: [Melon.Domain.Repo]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
