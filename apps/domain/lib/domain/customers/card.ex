defmodule Melon.Domain.Customers.Card do
  use Ecto.Schema

  schema "customers_cards" do
    field :number, :string
    field :is_active, :boolean

    belongs_to :identity, Melon.Domain.Customers.Identity
    belongs_to :issuer, Melon.Domain.Partners.Point

    timestamps(type: :utc_datetime)
  end
end
