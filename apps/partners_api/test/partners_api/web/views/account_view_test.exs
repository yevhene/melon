defmodule Melon.PartnersAPI.Web.AccountViewTest do
  use Melon.PartnersAPI.Web.ConnCase, async: true

  import Phoenix.View

  alias Melon.PartnersAPI.Web.AccountView
  alias Melon.PartnersAPI.Web.IdentityView

  setup do
    account = :account |> insert |> with_identities
    {:ok, account: account}
  end

  test "render account.json", %{account: account} do
    assert render(AccountView, "account.json", %{account: account}) == %{
      id: account.id,
      identities: render_many(
        account.identities, IdentityView, "identity.json"),
      inserted_at: DateTime.to_iso8601(account.inserted_at)}
  end
end
