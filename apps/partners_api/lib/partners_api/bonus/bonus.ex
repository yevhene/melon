defmodule Melon.PartnersAPI.Bonus do
  import Ecto.{Query, Changeset}, warn: false
  alias Melon.Domain.Repo

  alias Melon.Domain.Bonus.Operation
  alias Melon.Domain.Customers.Account
  alias Melon.Domain.Partners.Point

  def list_operations(%Account{} = account) do
    Operation
    |> scope(account)
    |> Repo.all()
  end

  def get_operation!(id, %Account{} = account) do
    Operation
    |> scope(account)
    |> Repo.get!(id)
  end

  def create_operation(attrs, %Account{} = account, %Point{} = point) do
    %Operation{account_id: account.id, point_id: point.id}
    |> operation_changeset(attrs)
    |> Repo.insert()
  end

  defp scope(model, %Account{} = account) do
    model
    |> where([a], ^account.id == a.account_id)
  end

  defp operation_changeset(%Operation{} = operation, attrs) do
    operation
    |> cast(attrs, [:value, :account_id, :point_id])
    |> validate_required([:value, :account_id, :point_id])
    |> foreign_key_constraint(:account_id)
    |> foreign_key_constraint(:point_id)
  end
end
