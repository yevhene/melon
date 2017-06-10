defmodule Melon.Domain.Customers.Account do
  use Ecto.Schema

  schema "customers_accounts" do
    belongs_to :realm, Melon.Domain.Bonus.Realm

    has_many :identities, Melon.Domain.Customers.Identity

    timestamps(type: :utc_datetime)
  end
end
