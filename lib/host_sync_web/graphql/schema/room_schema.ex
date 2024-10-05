defmodule HostSyncWeb.Graphql.Schema.RoomSchema do
  @moduledoc """
  Room GraphQL type, querys and mutations definitions.
  """

  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :classic

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  alias HostSyncWeb.Graphql.DataSource

  enum :room_type_enum do
    value :shared_room, description: "Single room"
    value :single_room, description: "Double room"
  end

  object :room do
    field :id, :id
    field :location, non_null(:string)
    field :price, non_null(:float)
    field :description, :string
    field :available, non_null(:boolean)
    field :room_type, non_null(:room_type_enum)

    field :amenities, list_of(:amenity), resolve: dataloader(DataSource)
  end

  input_object :room_input do
    field :location, non_null(:string)
    field :price, non_null(:integer)
    field :description, :string
    field :available, non_null(:boolean)
    field :room_type, non_null(:room_type_enum)
  end

  object :room_mutations do
    @desc "Create a new room"
    field :create_room, type: :room do
      arg :room, non_null(:room_input)

      resolve(&HostSyncWeb.Graphql.Resolvers.RoomResolver.create_room/3)
    end

    @desc "Update an room"
    field :update_room, type: :room do
      arg :id, non_null(:id)
      arg :room, non_null(:room_input)

      resolve(&HostSyncWeb.Graphql.Resolvers.RoomResolver.update_room/3)
    end
  end
end
