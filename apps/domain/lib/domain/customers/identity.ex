defmodule Melon.Domain.Customers.Identity do
  use Ecto.Schema

  schema "customers_identities" do
    field :name, :string
    field :email, :string
    field :address, :string
    field :birthday, :date
    field :comment, :string

    belongs_to :account, Melon.Domain.Customers.Account

    has_many :cards, Melon.Domain.Customers.Card
    has_many :phones, Melon.Domain.Customers.Phone

    timestamps(type: :utc_datetime)
  end
end
