defmodule Melon.PartnersAPI.Web.AccountController do
  use Melon.PartnersAPI.Web, :controller

  alias Melon.PartnersAPI.Customers

  action_fallback Hourly.Web.FallbackController

  def index(conn, _params) do
    realm = conn.assigns.key.point.realm
    accounts = Customers.list_accounts(realm)

    render(conn, "index.json", accounts: accounts)
  end
end
