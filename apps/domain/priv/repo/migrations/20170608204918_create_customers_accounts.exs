defmodule Melon.Domain.Repo.Migrations.CreateCustomersAccounts do
  use Ecto.Migration

  def change do
    create table(:customers_accounts) do
      add :realm_id, references(:bonus_realms), null: false

      timestamps(type: :utc_datetime)
    end

    create index(:customers_accounts, [:realm_id])
  end
end
