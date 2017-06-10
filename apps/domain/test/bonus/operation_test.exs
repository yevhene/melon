defmodule Melon.Domain.Partners.OperationTest do
  use Melon.Domain.DataCase, async: true

  test "has valid factory" do
    assert insert(:operation)
  end
end
