defmodule Melon.Domain.Partners.KeyTest do
  use Melon.Domain.DataCase, async: true

  test "has valid factory" do
    assert insert(:key)
  end
end
