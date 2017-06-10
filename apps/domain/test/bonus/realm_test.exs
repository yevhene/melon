defmodule Melon.Domain.Partners.RealmTest do
  use Melon.Domain.DataCase, async: true

  test "has valid factory" do
    assert insert(:realm)
  end
end
