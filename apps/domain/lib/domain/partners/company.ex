defmodule Melon.Domain.Partners.Company do
  use Ecto.Schema

  schema "partners_company" do
    field :name, :string

    has_many :programs, Melon.Domain.Bonus.Program

    timestamps(type: :utc_datetime)
  end
end
