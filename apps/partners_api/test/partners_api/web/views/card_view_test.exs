defmodule Melon.PartnersAPI.Web.CardViewTest do
  use Melon.PartnersAPI.Web.ConnCase, async: true

  import Phoenix.View

  alias Melon.PartnersAPI.Web.CardView

  setup do
    card = insert(:card)
    {:ok, card: card}
  end

  test "render card.json", %{card: card} do
    assert render(CardView, "card.json", %{card: card}) == %{
      id: card.id,
      number: card.number,
      is_active: card.is_active,
      inserted_at: DateTime.to_iso8601(card.inserted_at)}
  end
end
