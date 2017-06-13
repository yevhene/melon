defmodule Melon.PartnersAPI.Web.Customers.PhoneView do
  use Melon.PartnersAPI.Web, :view

  alias Melon.PartnersAPI.Web.Customers.PhoneView

  def render("show.json", %{phone: phone}) do
    render_one(phone, PhoneView, "phone.json")
  end

  def render("phone.json", %{phone: phone}) do
    %{id: phone.id,
      number: phone.number,
      is_active: phone.is_active,
      inserted_at: DateTime.to_iso8601(phone.inserted_at)}
  end
end
