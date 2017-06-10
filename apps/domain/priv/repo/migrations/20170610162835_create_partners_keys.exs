defmodule Melon.Domain.Repo.Migrations.CreatePartnersKeys do
  use Ecto.Migration

  def change do
    create table(:partners_keys) do
      add :token, :string, null: false
      add :expired_at, :utc_datetime, null: false,
        default: fragment("CURRENT_TIMESTAMP + interval '1 year'")

      add :point_id, references(:partners_keys), null: false

      timestamps(type: :utc_datetime)
    end

    create index(:partners_keys, [:token], unique: true)
    create index(:partners_keys, [:point_id])
  end
end
