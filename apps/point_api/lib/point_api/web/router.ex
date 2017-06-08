defmodule Bonus.PointAPI.Web.Router do
  use Bonus.PointAPI.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Bonus.PointAPI.Web do
    pipe_through :api
  end
end
