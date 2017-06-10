defmodule Melon.PartnersAPI.PartnersTest do
  use Melon.PartnersAPI.DataCase

  alias Melon.Domain.Partners.Key
  alias Melon.PartnersAPI.Partners

  describe "get_key/1" do
    test "with valid token returns key and preloads point and realm" do
      key = insert(:key)

      assert (%Key{} = returned_key) = Partners.get_key(key.token)
      assert returned_key.id == key.id
      assert returned_key.point
      assert returned_key.point.realm
    end

    test "with invalid token returns nil" do
      returned_key = Partners.get_key("invalid")
      assert returned_key == nil
    end

    test "with expired token returns nil" do
      expired_at = NaiveDateTime.utc_now
      key = insert(:key, expired_at: expired_at)

      returned_key = Partners.get_key(key.token)
      assert returned_key == nil
    end

    test "with token which expires in an hour returns key" do
      expired_at = NaiveDateTime.utc_now |> NaiveDateTime.add(60 * 60)
      key = insert(:key, expired_at: expired_at)

      %Key{} = Partners.get_key(key.token)
    end
  end
end
