import EctoEnum

defmodule Melon.Domain.Partners.Point do
  use Ecto.Schema

  defenum TypeEnum, "partners_points_type", [:trade, :office]

  schema "partners_points" do
    field :name, :string
    field :type, TypeEnum

    field :description, :string
    field :address, :string
    field :latitude, :float
    field :longitude, :float

    belongs_to :company, Melon.Domain.Partners.Company
    belongs_to :program, Melon.Domain.Bonus.Program

    has_many :keys, Melon.Domain.Partners.Key

    timestamps(type: :utc_datetime)
  end
end
