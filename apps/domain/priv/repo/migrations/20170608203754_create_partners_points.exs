defmodule Melon.Domain.Repo.Migrations.CreatePartnersPoints do
  use Ecto.Migration

  def change do
    Melon.Domain.Partners.Point.TypeEnum.create_type

    create table(:partners_points) do
      add :name, :text, null: false
      add :type, :partners_points_type, null: false, default: "trade"

      add :description, :text
      add :address, :text
      add :latitude, :float
      add :longitude, :float

      add :company_id, references(:partners_companies), null: false
      add :realm_id, references(:bonus_realms), null: false

      timestamps(type: :utc_datetime)
    end

    create index(:partners_points, [:company_id])
    create index(:partners_points, [:realm_id])
    create index(:partners_points, [:name, :company_id, :realm_id],
      unique: true)
  end
end
