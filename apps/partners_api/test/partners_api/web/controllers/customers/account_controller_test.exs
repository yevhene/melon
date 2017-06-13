defmodule Melon.PartnersAPI.Web.Customers.AccountControllerTest do
  use Melon.PartnersAPI.Web.ConnCase

  alias Melon.PartnersAPI.Web.Customers.AccountView

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index/2" do
    def generate_accounts(realm) do
      :account
      |> insert_pair(realm: realm)
      |> Enum.map(&with_identities(&1))
    end

    setup %{conn: conn, realm: realm} do
      {:ok, conn: conn, accounts: generate_accounts(realm)}
    end

    test "lists all entries on index", %{conn: conn, accounts: accounts} do
      conn = get conn, customers_account_path(conn, :index)

      assert json_response(conn, 200) ==
        render_json(AccountView, "index.json", accounts: accounts)
    end
  end
end
