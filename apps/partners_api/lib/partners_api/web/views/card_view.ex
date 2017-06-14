defmodule Melon.PartnersAPI.Web.CardView do
  use Melon.PartnersAPI.Web, :view

  alias Melon.PartnersAPI.Web.CardView

  def render("card.json", %{card: card}) do
    %{id: card.id,
      number: card.number,
      is_active: card.is_active,
      inserted_at: DateTime.to_iso8601(card.inserted_at)}
  end
end
