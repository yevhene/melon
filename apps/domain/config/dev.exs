use Mix.Config

# Configure your database
config :domain, Bonus.Domain.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "bonus_dev",
  hostname: "localhost",
  pool_size: 10
