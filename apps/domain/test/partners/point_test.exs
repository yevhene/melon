defmodule Melon.Domain.Partners.PointTest do
  use Melon.Domain.DataCase, async: true

  test "has valid factory" do
    assert insert(:point)
  end
end
