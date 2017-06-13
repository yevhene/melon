defmodule Melon.PartnersAPI.Web.Router do
  use Melon.PartnersAPI.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug Melon.PartnersAPI.Web.AuthenticatePlug
  end

  scope "/", Melon.PartnersAPI.Web.Customers, as: :customers do
    pipe_through [:api, :auth]

    resources "/accounts", AccountController, only: [:index]
  end
end
