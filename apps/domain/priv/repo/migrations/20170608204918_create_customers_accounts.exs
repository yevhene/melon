defmodule Melon.Domain.Repo.Migrations.CreateCustomersAccounts do
  use Ecto.Migration

  def change do
    create table(:customers_accounts) do
      add :program_id, references(:bonus_programs), null: false

      timestamps(type: :utc_datetime)
    end

    create index(:customers_accounts, [:program_id])
  end
end
