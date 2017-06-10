defmodule Melon.Domain.Customers.Phone do
  use Ecto.Schema

  schema "customers_phones" do
    field :number, :string
    field :is_active, :boolean

    belongs_to :identity, Melon.Domain.Customers.Identity

    timestamps(type: :utc_datetime)
  end
end
