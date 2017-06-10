defmodule Melon.PartnersAPI.Web.Customers.PhoneViewTest do
  use Melon.PartnersAPI.Web.ConnCase, async: true

  import Phoenix.View

  alias Melon.PartnersAPI.Web.Customers.PhoneView

  setup do
    phone = insert(:phone)
    {:ok, phone: phone}
  end

  test "render show.json", %{phone: phone} do
    assert render(PhoneView, "show.json", %{phone: phone}) ==
      render(PhoneView, "phone.json", %{phone: phone})
  end

  test "render phone.json", %{phone: phone} do
    assert render(PhoneView, "phone.json", %{phone: phone}) == %{
      id: phone.id,
      number: phone.number,
      is_active: phone.is_active,
      inserted_at: DateTime.to_iso8601(phone.inserted_at)}
  end
end
