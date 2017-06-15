defmodule Melon.PartnersAPI.Web.PhoneView do
  use Melon.PartnersAPI.Web, :view

  def render("phone.json", %{phone: phone}) do
    %{id: phone.id,
      number: phone.number,
      is_active: phone.is_active,
      inserted_at: DateTime.to_iso8601(phone.inserted_at)}
  end
end
