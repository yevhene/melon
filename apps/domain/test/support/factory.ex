defmodule Melon.Domain.Factory do
  use ExMachina.Ecto, repo: Melon.Domain.Repo

  alias Melon.Domain.Bonus.Operation
  alias Melon.Domain.Bonus.Realm
  alias Melon.Domain.Customers.Account
  alias Melon.Domain.Customers.Card
  alias Melon.Domain.Customers.Identity
  alias Melon.Domain.Customers.Phone
  alias Melon.Domain.Partners.Company
  alias Melon.Domain.Partners.Key
  alias Melon.Domain.Partners.Point

  def company_factory do
    %Company{
      name: Faker.Company.name
    }
  end

  def realm_factory do
    %Realm{
      name: Faker.Company.bs,
      company: build(:company)
    }
  end

  def point_factory do
    %Point{
      name: Faker.Company.bs,
      type: :trade,
      description: Faker.Lorem.Shakespeare.hamlet,
      address: Faker.Address.street_address,
      latitude: Faker.Address.latitude,
      longitude: Faker.Address.longitude,
      company: build(:company),
      realm: build(:realm)
    }
  end

  def account_factory do
    %Account{
      realm: build(:realm)
    }
  end

  def with_identities(%Account{} = account) do
    identities = :identity
      |> insert_pair(account: account)
      |> Enum.map(&with_cards(&1))
      |> Enum.map(&with_phones(&1))

    account |> Map.put(:identities, identities)
  end

  def identity_factory do
    %Identity{
      name: Faker.Name.name,
      email: Faker.Internet.email,
      address: Faker.Address.street_address,
      birthday: Faker.Date.date_of_birth,
      comment: Faker.Lorem.Shakespeare.hamlet,
      account: build(:account)
    }
  end

  def with_cards(%Identity{} = identity) do
    cards = insert_pair(:card, identity: identity)
    identity |> Map.put(:cards, cards)
  end

  def with_phones(%Identity{} = identity) do
    phones = insert_pair(:phone, identity: identity)
    identity |> Map.put(:phones, phones)
  end

  def card_factory do
    %Card{
      number: Faker.Phone.EnUs.subscriber_number,
      is_active: true,
      identity: build(:identity),
      issuer: build(:point)
    }
  end

  def phone_factory do
    %Phone{
      number: Faker.Phone.EnUs.phone,
      is_active: true,
      identity: build(:identity)
    }
  end

  def operation_factory do
    %Operation{
      value: :rand.uniform(100),
      account: build(:account),
      point: build(:point)
    }
  end

  def key_factory do
    %Key{
      token: Key.generate_token,
      point: build(:point),
      expired_at: NaiveDateTime.utc_now |> NaiveDateTime.add(60 * 60 * 24 * 365)
    }
  end
end
