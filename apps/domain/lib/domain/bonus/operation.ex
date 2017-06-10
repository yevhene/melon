defmodule Melon.Domain.Bonus.Operation do
  use Ecto.Schema

  schema "bonus_operations" do
    field :value, :integer
    field :activated_at, :utc_datetime

    belongs_to :account, Melon.Domain.Customers.Account
    belongs_to :point, Melon.Domain.Partners.Point

    timestamps(type: :utc_datetime)
  end
end
