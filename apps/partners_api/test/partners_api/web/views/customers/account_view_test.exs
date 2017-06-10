defmodule Melon.PartnersAPI.Web.Customers.AccountViewTest do
  use Melon.PartnersAPI.Web.ConnCase, async: true

  import Phoenix.View

  alias Melon.PartnersAPI.Web.Customers.AccountView
  alias Melon.PartnersAPI.Web.Customers.IdentityView

  setup do
    account = :account |> insert |> with_identities

    {:ok, account: account}
  end

  test "render index.json", %{account: account} do
    assert render(AccountView, "index.json", %{accounts: [account]}) == %{
      data: [render(AccountView, "account.json", %{account: account})]}
  end

  test "render account.json", %{account: account} do
    assert render(AccountView, "account.json", %{account: account}) == %{
      id: account.id,
      identities: render_many(
        account.identities, IdentityView, "identity.json"),
      inserted_at: DateTime.to_iso8601(account.inserted_at)}
  end
end
