defmodule Melon.PartnersAPI.CustomersTest do
  use Melon.PartnersAPI.DataCase

  alias Melon.Domain.Customers.Account
  alias Melon.PartnersAPI.Customers

  describe "list_accounts/1" do
    def generate_account(realm) do
      :account
      |> insert(realm: realm)
      |> with_identities
    end

    setup do
      realm = insert(:realm)
      insert(:account)
      {:ok, realm: realm, account: generate_account(realm)}
    end

    test "returns correct accounts", %{realm: realm, account: account} do
      [%Account{} = returned_account] = Customers.list_accounts(realm)

      assert returned_account.id == account.id
    end

    test "returns accounts with preloads", %{realm: realm} do
      [%Account{} = returned_account] = Customers.list_accounts(realm)

      assert returned_account.identities

      identity = returned_account.identities |> Enum.at(0)

      assert identity.cards
      assert identity.phones
    end
  end
end
