use Mix.Config

# Configure your database
config :domain, Melon.Domain.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "melon_dev",
  hostname: "localhost",
  pool_size: 10
