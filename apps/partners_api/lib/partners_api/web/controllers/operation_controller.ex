defmodule Melon.PartnersAPI.Web.OperationController do
  use Melon.PartnersAPI.Web, :controller

  plug :set_account

  alias Melon.PartnersAPI.Bonus
  alias Melon.PartnersAPI.Customers
  alias Melon.Domain.Bonus.Operation

  action_fallback Hourly.Web.FallbackController

  def index(conn, %{account: account}) do
    operations = Bonus.list_operations(account)

    render(conn, "index.json", operations: operations)
  end

  def show(conn, %{"id" => id, account: account}) do
    operation = Bonus.get_operation!(id, account)

    render(conn, "show.json", operation: operation)
  end

  def create(conn, %{"operation" => params, account: account}) do
    point = conn.assigns.key.point

    with {:ok, %Operation{} = operation} <- Bonus.create_operation(
      params, account, point
    ) do
      conn
      |> put_status(:created)
      |> put_resp_header("location",
        account_operation_path(conn, :show, operation))
      |> render("show.json", operation: operation)
    end
  end

  defp set_account(conn, _) do
    realm = conn.assigns.key.point.realm
    account = Customers.get_account!(conn.params["account_id"], realm)

    conn |> assign(:account, account)
  end
end
