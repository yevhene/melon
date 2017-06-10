defmodule Melon.Domain.Bonus.Realm do
  use Ecto.Schema

  schema "bonus_realms" do
    field :name, :string

    belongs_to :company, Melon.Domain.Partners.Company

    has_many :points, Melon.Domain.Partners.Point

    timestamps(type: :utc_datetime)
  end
end
