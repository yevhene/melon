defmodule Melon.Domain.Partners.CardTest do
  use Melon.Domain.DataCase, async: true

  test "has valid factory" do
    assert insert(:card)
  end
end
