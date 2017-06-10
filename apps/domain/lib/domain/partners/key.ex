defmodule Melon.Domain.Partners.Key do
  use Ecto.Schema

  schema "partners_keys" do
    field :token, :string
    field :expired_at, :utc_datetime

    belongs_to :point, Melon.Domain.Partners.Point

    timestamps(type: :utc_datetime)
  end

  def generate_token(length \\ 64) do
    :crypto.strong_rand_bytes(length)
    |> Base.url_encode64
    |> binary_part(0, length)
  end
end
