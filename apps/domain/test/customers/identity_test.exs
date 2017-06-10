defmodule Melon.Domain.Partners.IdentityTest do
  use Melon.Domain.DataCase, async: true

  test "has valid factory" do
    assert insert(:identity)
  end
end
