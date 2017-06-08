defmodule Melon.Domain.Partners.Point do
  use Ecto.Schema

  schema "partners_points" do
    field :name, :string

    field :description, :string
    field :address, :string
    field :latitude, :float
    field :longitude, :float

    belongs_to :company, Melon.Domain.Partners.Company
    belongs_to :program, Melon.Domain.Bonus.Program

    timestamps(type: :utc_datetime)
  end
end
