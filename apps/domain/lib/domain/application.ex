defmodule Melon.Domain.Application do
  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Define workers and child supervisors to be supervised
    children = [
      # Start the Ecto repository
      supervisor(Melon.Domain.Repo, []),
      # Starts a worker by calling:
      # Melon.Domain.Worker.start_link(arg1, arg2, arg3)
      # worker(Melon.Domain.Worker, [arg1, arg2, arg3]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Melon.Domain.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
