defmodule HostSyncWeb.Graphql.Schema.ProfileSchema do
  @moduledoc """
  Profile GraphQL type, querys and mutations definitions.
  """

  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :classic

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  alias HostSyncWeb.Graphql.DataSource

  @desc "Profile data for guests"
  object :profile do
    field :id, non_null(:id), description: "Unique identifier of the profile"
    field :max_price, non_null(:integer), description: "Maximum price guest is willing to pay"
    field :bio, :string, description: "Short biography of the guest"

    field :preferred_room_type, non_null(:preferred_room_type), description: "Preferred room type"

    field :is_smoker, non_null(:boolean), description: "Whether the guest is a smoker"
    field :has_pets, non_null(:boolean), description: "Whether the guest has pets"

    field :pet_friendly, non_null(:boolean),
      description: "Whether the guest prefers pet-friendly places"

    field :guest_occupation, :string, description: "Occupation of the guest"
    field :nationality, non_null(:string), description: "Nationality of the guest"
    field :birthdate, non_null(:date), description: "Birthdate of the guest"

    field :user, :user, resolve: dataloader(DataSource), description: "User who owns the profile"
  end

  enum :preferred_room_type do
    value :single_room, description: "A single room"
    value :shared_room, description: "A shared room"
    value :entire_place, description: "An entire place"
  end

  input_object :profile_input do
    field :max_price, non_null(:integer)
    field :bio, :string
    field :preferred_room_type, non_null(:preferred_room_type)
    field :is_smoker, non_null(:boolean)
    field :has_pets, non_null(:boolean)
    field :pet_friendly, non_null(:boolean)
    field :guest_occupation, :string
    field :nationality, non_null(:string)
    field :birthdate, non_null(:date)
    field :user_id, non_null(:id)
  end

  object :profile_mutations do
    field :create_profile, type: :profile do
      arg :profile_input, non_null(:profile_input)

      resolve(&HostSyncWeb.Graphql.Resolvers.ProfileResolver.create_profile/3)
    end

    field :update_profile, type: :profile do
      arg :id, non_null(:id)
      arg :profile_input, non_null(:profile_input)

      resolve(&HostSyncWeb.Graphql.Resolvers.ProfileResolver.update_profile/3)
    end
  end

  object :profile_queries do
    @desc "Get a profile by ID"
    field :profile, type: :profile do
      arg :id, non_null(:id)

      resolve(&HostSyncWeb.Graphql.Resolvers.ProfileResolver.get_profile/3)
    end
  end
end
