defmodule Melon.Domain.Repo.Migrations.CreateBonusRealms do
  use Ecto.Migration

  def change do
    create table(:bonus_realms) do
      add :name, :text

      add :company_id, references(:partners_companies), null: false

      timestamps(type: :utc_datetime)
    end

    create index(:bonus_realms, [:company_id])
  end
end
