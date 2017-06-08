use Mix.Config

# Configure your database
config :domain, Melon.Domain.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "melon_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
