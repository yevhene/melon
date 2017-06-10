defmodule Melon.Domain.Partners.PhoneTest do
  use Melon.Domain.DataCase, async: true

  test "has valid factory" do
    assert insert(:phone)
  end
end
