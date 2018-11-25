defmodule Dingen do
  @moduledoc """
  Dingen keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  import Ecto.Query, warn: false

  alias Dingen.Repo
  alias Dingen.Tenant

  def create_tenant(attrs \\ %{}) do
    %Tenant{}
    |> Tenant.changeset(attrs)
    |> Repo.insert()
  end

  def get_tenant_by_host(host) when is_binary(host) do
    Repo.get_by(Tenant, host: host)
  end
end
