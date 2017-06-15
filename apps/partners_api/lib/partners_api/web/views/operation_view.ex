defmodule Melon.PartnersAPI.Web.OperationView do
  use Melon.PartnersAPI.Web, :view

  alias Melon.PartnersAPI.Web.OperationView
  alias Melon.PartnersAPI.Web.PointView

  def render("index.json", %{operations: operations}) do
    %{data: render_many(operations, OperationView, "operation.json")}
  end

  def render("show.json", %{operation: operation}) do
    render_one(operation, OperationView, "operation.json")
  end

  def render("operation.json", %{operation: operation}) do
    %{id: operation.id,
      point: render_one(operation.point, PointView, "point.json"),
      activated_at: DateTime.to_iso8601(operation.activated_at),
      inserted_at: DateTime.to_iso8601(operation.inserted_at)}
  end
end
