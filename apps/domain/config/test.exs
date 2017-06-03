use Mix.Config

# Configure your database
config :domain, Bonus.Domain.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "bonus_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
