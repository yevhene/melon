defmodule Melon.PartnersAPI.Customers do
  import Ecto.{Query, Changeset}, warn: false
  alias Melon.Domain.Repo

  alias Melon.Domain.Bonus.Realm
  alias Melon.Domain.Customers.Account

  def list_accounts(%Realm{} = realm) do
    Account
    |> scope(realm)
    |> Repo.all()
    |> Repo.preload(identities: [:cards, :phones])
  end

  def get_account!(id, %Realm{} = realm) do
    Account
    |> scope(realm)
    |> Repo.get!(id)
  end

  defp scope(model, %Realm{} = realm) do
    model
    |> where([a], ^realm.id == a.realm_id)
  end
end
