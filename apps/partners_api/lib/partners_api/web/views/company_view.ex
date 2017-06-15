defmodule Melon.PartnersAPI.Web.CompanyView do
  use Melon.PartnersAPI.Web, :view

  def render("company.json", %{company: company}) do
    %{id: company.id,
      name: company.name,
      inserted_at: DateTime.to_iso8601(company.inserted_at)}
  end
end
