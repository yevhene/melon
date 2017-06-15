defmodule Melon.PartnersAPI.Web.AuthenticatePlug do
  import Plug.Conn

  alias Melon.PartnersAPI.Partners

  def init(opts) do
    opts
  end

  def call(conn, _opts) do
    case conn |> get_token do
      "Bearer " <> token ->
        key = Partners.get_key(token)

        if key do
          conn |> assign(:key, key)
        else
          raise Melon.PartnersAPI.UnauthrorizedError
        end
      _ ->
        raise Melon.PartnersAPI.UnauthrorizedError
    end
  end

  defp get_token(conn) do
    conn
    |> get_req_header("authorization")
    |> List.first
  end
end
