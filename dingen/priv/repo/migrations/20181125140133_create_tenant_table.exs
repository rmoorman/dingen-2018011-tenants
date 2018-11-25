defmodule Dingen.Repo.Migrations.CreateTenantTable do
  use Ecto.Migration

  def change do
    create table(:tenant) do
      add :host, :string, null: false

      timestamps()
    end

    create unique_index(:tenant, [:host])
  end
end
