defmodule Melon.PartnersAPI.Partners do
  import Ecto.{Query, Changeset}, warn: false
  alias Melon.Domain.Repo

  alias Melon.Domain.Partners.Key

  def get_key(token) do
    Key
    |> where([k], ^DateTime.utc_now < k.expired_at)
    |> Repo.get_by(token: token)
    |> Repo.preload(point: :realm)
  end
end
