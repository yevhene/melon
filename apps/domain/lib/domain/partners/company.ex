defmodule Melon.Domain.Partners.Company do
  use Ecto.Schema

  schema "partners_companies" do
    field :name, :string

    has_many :points, Melon.Domain.Partners.Point
    has_many :realms, Melon.Domain.Bonus.Realm

    timestamps(type: :utc_datetime)
  end
end
