defmodule Melon.PartnersAPI.Web.Router do
  use Melon.PartnersAPI.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Melon.PartnersAPI.Web do
    pipe_through :api
  end
end
