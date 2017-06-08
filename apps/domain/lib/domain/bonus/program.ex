defmodule Melon.Domain.Bonus.Program do
  use Ecto.Schema

  schema "bonus_programs" do
    field :name, :string

    belongs_to :company, Melon.Domain.Partners.Company

    has_many :points, Melon.Domain.Partners.Point

    timestamps(type: :utc_datetime)
  end
end
