defmodule Melon.Domain.Repo.Migrations.CreateBonusPrograms do
  use Ecto.Migration

  def change do
    create table(:bonus_programs) do
      add :name, :text

      add :company_id, references(:partners_companies), null: false

      timestamps(type: :utc_datetime)
    end

    create index(:bonus_programs, [:company_id])
  end
end
