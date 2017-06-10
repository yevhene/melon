defmodule Melon.Domain.Partners.CompanyTest do
  use Melon.Domain.DataCase, async: true

  test "has valid factory" do
    assert insert(:company)
  end
end
