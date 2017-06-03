defmodule Bonus.OutletAPI.Web.Router do
  use Bonus.OutletAPI.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Bonus.OutletAPI.Web do
    pipe_through :api
  end
end
