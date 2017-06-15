defmodule Melon.PartnersAPI.Web.PointView do
  use Melon.PartnersAPI.Web, :view

  alias Melon.PartnersAPI.Web.CompanyView

  def render("point.json", %{point: point}) do
    %{id: point.id,
      name: point.name,
      type: point.type,
      description: point.description,
      address: point.address,
      latitude: point.latitude,
      longitude: point.longitude,
      company: render_one(point.company, CompanyView, "company.json"),
      inserted_at: DateTime.to_iso8601(point.inserted_at)}
  end
end
