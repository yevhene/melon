defmodule Melon.Domain.Partners.Company do
  use Ecto.Schema

  schema "partners_company" do
    field :name, :string

    timestamps(type: :utc_datetime)
  end
end
