defmodule Melon.Domain.Repo.Migrations.CreateCustomersCards do
  use Ecto.Migration

  def change do
    create table(:customers_cards) do
      add :number, :text, null: false
      add :is_active, :boolean, null: false, default: true

      add :identity_id, references(:customers_identities), null: false
      add :issuer_id, references(:partners_points)

      timestamps(type: :utc_datetime)
    end

    create index(:customers_cards, [:number, :identity_id], unique: true)
    create index(:customers_cards, [:identity_id])
  end
end
