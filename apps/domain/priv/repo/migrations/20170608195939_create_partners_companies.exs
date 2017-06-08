defmodule Melon.Domain.Repo.Migrations.CreatePartnersCompanies do
  use Ecto.Migration

  def change do
    create table(:partners_companies) do
      add :name, :text, null: false

      timestamps(type: :utc_datetime)
    end
  end
end
