defmodule HostSync.Schemas.Room do
  use Ecto.Schema
  import Ecto.Changeset

  alias HostSync.Schemas.{Amenity, User}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @required_params ~w(location price host_id available room_type)a
  @optional_params ~w(description)a

  schema "rooms" do
    field :location, :string
    field :price, :integer
    field :description, :string
    field :available, :boolean, default: true
    field :room_type, Ecto.Enum, values: [:single_room, :shared_room]

    belongs_to :host, User
    many_to_many :amenities, Amenity, join_through: "rooms_amenities", on_replace: :delete

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params ++ @optional_params)
    |> validate_number(:price, greater_than: 0)
    |> validate_inclusion(:preferred_room_type, [:single_room, :shared_room])
    |> cast_assoc(:amenities)
  end
end
