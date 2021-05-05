defmodule PlacesApi.Places.Place do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "places" do
    field :name, :string
    field :private, :boolean, default: false
    belongs_to :owner, PlacesApi.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(place, attrs) do
    place
    |> cast(attrs, [:name, :private])
    |> validate_required([:name, :private])
    |> unique_constraint(:name)
  end
end
