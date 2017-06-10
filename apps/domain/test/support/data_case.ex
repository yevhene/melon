defmodule Melon.Domain.DataCase do
  @moduledoc """
  This module defines the setup for tests requiring
  access to the application's data layer.

  You may define functions here to be used as helpers in
  your tests.

  Finally, if the test case interacts with the database,
  it cannot be async. For this reason, every test runs
  inside a transaction which is reset at the beginning
  of the test unless the test case is marked as async.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      alias Melon.Domain.Repo

      import Ecto
      import Melon.Domain.DataCase
      import Melon.Domain.Factory
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Melon.Domain.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Melon.Domain.Repo, {:shared, self()})
    end

    :ok
  end
end
