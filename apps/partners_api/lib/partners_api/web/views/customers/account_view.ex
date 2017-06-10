defmodule Melon.PartnersAPI.Web.Customers.AccountView do
  use Melon.PartnersAPI.Web, :view

  alias Melon.PartnersAPI.Web.Customers.AccountView
  alias Melon.PartnersAPI.Web.Customers.IdentityView

  def render("index.json", %{accounts: accounts}) do
    %{data: render_many(accounts, AccountView, "account.json")}
  end

  def render("account.json", %{account: account}) do
    %{id: account.id,
      identities: render_many(
        account.identities, IdentityView, "identity.json"),
      inserted_at: DateTime.to_iso8601(account.inserted_at)}
  end
end
