defmodule HostSync.Accounts.Profile do
  use Ecto.Schema
  import Ecto.Changeset
  alias HostSync.Accounts.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @required_params ~w(max_price preferred_location user_id)a

  schema "profiles" do
    field :preferred_location, :string
    field :max_price, :decimal
    belongs_to :user, User

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
  end
end
