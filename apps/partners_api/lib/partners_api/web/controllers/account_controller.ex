defmodule Melon.PartnersAPI.Web.AccountController do
  use Melon.PartnersAPI.Web, :controller

  alias Melon.PartnersAPI.Customers

  action_fallback Hourly.Web.FallbackController

  def index(conn, _params) do
    accounts = Customers.list_accounts(conn.assigns.realm)
    render(conn, "index.json", accounts: accounts)
  end
end
