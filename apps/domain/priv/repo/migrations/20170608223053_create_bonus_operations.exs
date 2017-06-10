defmodule Melon.Domain.Repo.Migrations.CreateBonusOperations do
  use Ecto.Migration

  def change do
    create table(:bonus_operations) do
      add :value, :integer, null: false
      add :activated_at, :utc_datetime, null: false,
        default: fragment("CURRENT_TIMESTAMP")

      add :account_id, references(:customers_accounts), null: false
      add :point_id, references(:partners_points), null: false

      timestamps(type: :utc_datetime)
    end

    create index(:bonus_operations, [:account_id])
    create index(:bonus_operations, [:point_id])
  end
end
