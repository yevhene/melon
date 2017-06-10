defmodule Melon.PartnersAPI.Web.ConnCase do
  @moduledoc """
  This module defines the test case to be used by
  tests that require setting up a connection.

  Such tests rely on `Phoenix.ConnTest` and also
  import other functionality to make it easier
  to build common datastructures and query the data layer.

  Finally, if the test case interacts with the database,
  it cannot be async. For this reason, every test runs
  inside a transaction which is reset at the beginning
  of the test unless the test case is marked as async.
  """

  use ExUnit.CaseTemplate
  import Melon.Domain.Factory

  using do
    quote do
      # Import conveniences for testing with connections
      use Phoenix.ConnTest
      import Melon.Domain.Factory
      import Melon.PartnersAPI.Web.Router.Helpers
      import Melon.PartnersAPI.Json

      # The default endpoint for testing
      @endpoint Melon.PartnersAPI.Web.Endpoint
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Melon.Domain.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Melon.Domain.Repo, {:shared, self()})
    end

    conn = Phoenix.ConnTest.build_conn()
    params = [conn: conn]

    params = if tags[:unauthorized], do: params, else: authorize(params)

    {:ok, params}
  end

  defp authorize(params) do
    key = insert(:key)
    conn = params[:conn] |>
      Plug.Conn.put_req_header("authorization", "Bearer #{key.token}")
    params |> Keyword.merge([conn: conn, key: key, realm: key.point.realm])
  end
end
