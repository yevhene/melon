defmodule Melon.Domain.Repo.Migrations.CreatePartnersPoints do
  use Ecto.Migration

  def change do
    create table(:partners_points) do
      add :name, :text, null: false

      add :description, :text
      add :address, :text
      add :latitude, :float
      add :longitude, :float

      add :company_id, references(:partners_companies), null: false
      add :program_id, references(:bonus_programs), null: false

      timestamps(type: :utc_datetime)
    end

    create index(:partners_points, [:company_id])
    create index(:partners_points, [:program_id])
    create index(:partners_points, [:name, :company_id, :program_id],
      unique: true)
  end
end
