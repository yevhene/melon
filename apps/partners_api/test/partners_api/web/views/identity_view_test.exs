defmodule Melon.PartnersAPI.Web.IdentityViewTest do
  use Melon.PartnersAPI.Web.ConnCase, async: true

  import Phoenix.View

  alias Melon.PartnersAPI.Web.CardView
  alias Melon.PartnersAPI.Web.IdentityView
  alias Melon.PartnersAPI.Web.PhoneView

  setup do
    identity = :identity |> insert |> with_cards |> with_phones
    {:ok, identity: identity}
  end

  test "render identity.json", %{identity: identity} do
    assert render(IdentityView, "identity.json", %{identity: identity}) == %{
      id: identity.id,
      name: identity.name,
      email: identity.email,
      address: identity.address,
      birthday: identity.birthday,
      comment: identity.comment,
      cards: render_many(identity.cards, CardView, "card.json"),
      phones: render_many(identity.phones, PhoneView, "phone.json"),
      inserted_at: DateTime.to_iso8601(identity.inserted_at)}
  end
end
