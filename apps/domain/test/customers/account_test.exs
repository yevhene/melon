defmodule Melon.Domain.Partners.AccountTest do
  use Melon.Domain.DataCase, async: true

  test "has valid factory" do
    assert insert(:account)
  end
end
