defmodule Melon.PointAPI.Web.Router do
  use Melon.PointAPI.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Melon.PointAPI.Web do
    pipe_through :api
  end
end
