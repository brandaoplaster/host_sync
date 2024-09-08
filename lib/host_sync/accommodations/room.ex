defmodule HostSync.Accommodations.Room do
  use Ecto.Schema
  import Ecto.Changeset
  alias HostSync.Accounts.User

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

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params ++ @optional_params)
    |> validate_number(:price, greater_than: 0)
    |> validate_inclusion(:preferred_room_type, [:single_room, :shared_room])
  end
end
