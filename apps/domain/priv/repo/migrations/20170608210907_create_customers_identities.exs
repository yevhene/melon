defmodule Melon.Domain.Repo.Migrations.CreateCustomersIdentities do
  use Ecto.Migration

  def change do
    create table(:customers_identites) do
      add :name, :text, null: false
      add :email, :text
      add :address, :text
      add :birthday, :date
      add :comment, :text

      add :account_id, references(:customers_accounts), null: false

      timestamps(type: :utc_datetime)
    end

    create index(:customers_identites, [:name, :account_id], unique: true)
    create index(:customers_identites, [:account_id])
  end
end
