defmodule HostSync.Schemas.Amenity do
  use Ecto.Schema
  import Ecto.Changeset

  alias HostSync.Schemas.Room

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @required_params ~w(name)a
  @optional_params ~w(description)a

  schema "amenities" do
    field :name, :string
    field :description, :string

    many_to_many :rooms, Room, join_through: "rooms_amenities"

    timestamps()
  end

  @doc false
  def changeset(amenity, attrs) do
    amenity
    |> cast(attrs, @required_params ++ @optional_params)
    |> validate_required(@required_params)
    |> update_change(:name, &String.downcase/1)
    |> unique_constraint(:name)
  end
end
