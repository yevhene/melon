defmodule Melon.Domain.Repo.Migrations.CreateCustomersPhones do
  use Ecto.Migration

  def change do
    create table(:customers_phones) do
      add :number, :text, null: false
      add :is_active, :boolean, null: false, default: true

      add :identity_id, references(:customers_identites), null: false

      timestamps(type: :utc_datetime)
    end

    create index(:customers_phones, [:number, :identity_id], unique: true)
    create index(:customers_phones, [:identity_id])
  end
end
