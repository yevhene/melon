defmodule Melon.Domain.Customers.Account do
  use Ecto.Schema

  schema "customers_accounts" do
    belongs_to :program, Melon.Domain.Bonus.Program

    timestamps(type: :utc_datetime)
  end
end
