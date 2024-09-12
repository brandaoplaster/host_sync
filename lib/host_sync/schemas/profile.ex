defmodule HostSync.Schemas.Profile do
  use Ecto.Schema
  import Ecto.Changeset
  alias HostSync.Schemas.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @required_params ~w(max_price preferred_room_type user_id nationality birthdate)a
  @optional_params ~w(bio is_smoker has_pets pet_friendly guest_occupation)a

  schema "profiles" do
    field :max_price, :integer
    field :bio, :string
    field :preferred_room_type, Ecto.Enum, values: [:single_room, :shared_room, :entire_place]
    field :is_smoker, :boolean, default: false
    field :has_pets, :boolean, default: false
    field :pet_friendly, :boolean, default: false
    field :guest_occupation, :string
    field :nationality, :string
    field :birthdate, :date

    belongs_to :user, User

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params ++ @optional_params)
    |> validate_number(:max_price, greater_than: 0)
    |> validate_inclusion(:preferred_room_type, [:single_room, :shared_room, :entire_place])
  end
end
