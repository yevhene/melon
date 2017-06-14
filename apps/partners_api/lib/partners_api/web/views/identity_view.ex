defmodule Melon.PartnersAPI.Web.IdentityView do
  use Melon.PartnersAPI.Web, :view

  alias Melon.PartnersAPI.Web.IdentityView
  alias Melon.PartnersAPI.Web.CardView
  alias Melon.PartnersAPI.Web.PhoneView

  def render("identity.json", %{identity: identity}) do
    %{id: identity.id,
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
