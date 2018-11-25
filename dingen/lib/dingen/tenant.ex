defmodule Dingen.Tenant do
  use Ecto.Schema
  import Ecto.Changeset
  alias __MODULE__

  schema "tenant" do
    field :host, :string

    timestamps()
  end

  @doc false
  def changeset(%Tenant{} = tenant, attrs) do
    tenant
    |> cast(attrs, [:host])
    |> validate_required([:host])
    |> unique_constraint(:host)
  end
end
