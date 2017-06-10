defmodule Melon.PartnersAPI.Web.AuthenticatePlugTest do
  use Melon.PartnersAPI.Web.ConnCase, async: true

  setup do
    {:ok, key: insert(:key)}
  end

  test "user passed if correct token is present", %{key: key} do
    conn = build_conn()
    |> put_req_header("authorization", "Bearer #{key.token}")
    |> Melon.PartnersAPI.Web.AuthenticatePlug.call(%{})

    assert conn.status != 401
    assert conn.assigns.key != nil
    assert conn.assigns.realm != nil
  end

  test "user not passed if no token present" do
    assert_raise Melon.PartnersAPI.UnauthrorizedError, fn ->
      build_conn()
      |> Melon.PartnersAPI.Web.AuthenticatePlug.call(%{})
    end
  end

  test "user not passed if wrong token present" do
    assert_raise Melon.PartnersAPI.UnauthrorizedError, fn ->
      build_conn()
      |> put_req_header("authorization", "Bearer wrong")
      |> Melon.PartnersAPI.Web.AuthenticatePlug.call(%{})
    end
  end
end
