defmodule Melon.Domain.Customers.Identity do
  use Ecto.Schema

  schema "customers_identity" do
    field :name, :string
    field :email, :string
    field :address, :string
    field :birthday, :date
    field :comment, :string

    belongs_to :account, Melon.Domain.Customers.Account

    timestamps(type: :utc_datetime)
  end
end
