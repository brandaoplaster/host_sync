defmodule HostSyncWeb.Graphql.Schema.ProfileSchema do
  @moduledoc """
  Profile GraphQL type, querys and mutations definitions.
  """

  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :classic

  object :profile do
    field :id, :id
    field :max_price, :integer
    field :bio, :string
    field :is_smoker, :boolean
    field :has_pets, :boolean
    field :pet_friendly, :boolean
    field :guest_occupation, :string
    field :nationality, :string
    field :birthdate, :date

    field :inserted_at, :datetime
    field :updated_at, :datetime
  end
end
