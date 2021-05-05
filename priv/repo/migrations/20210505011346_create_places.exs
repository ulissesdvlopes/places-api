defmodule PlacesApi.Repo.Migrations.CreatePlaces do
  use Ecto.Migration

  def change do
    create table(:places, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :private, :boolean, default: false, null: false
      add :owner_id, references(:users, on_delete: :delete_all, type: :binary_id), null: false

      timestamps()
    end

    create unique_index(:places, [:name])
    create index(:places, [:owner_id])
  end
end
