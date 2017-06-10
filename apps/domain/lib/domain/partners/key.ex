defmodule Melon.Domain.Partners.Key do
  use Ecto.Schema

  schema "partners_keys" do
    field :token, :string
    field :expired_at, :boolean

    belongs_to :point, Melon.Domain.Partners.Point

    timestamps(type: :utc_datetime)
  end
end
