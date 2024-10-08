defmodule HostSyncWeb.Graphql.Schema.AmenitySchema do
  @moduledoc """
  Amenity GraphQL type, querys and mutations definitions.
  """

  use Absinthe.Schema.Notation

  object :amenity do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :description, :string
    field :created_at, non_null(:naive_datetime)
    field :updated_at, non_null(:naive_datetime)
  end

  input_object :amenity_input do
    field :name, non_null(:string)
    field :description, :string
  end

  object :amenity_mutations do
    field :create_amenity, type: :amenity do
      arg :amenity, non_null(:amenity_input)

      resolve(&HostSyncWeb.Graphql.Resolvers.AmenityResolver.create_amenity/3)
    end

    field :update_amenity, type: :amenity do
      arg :id, non_null(:id)
      arg :amenity, non_null(:amenity_input)

      resolve(&HostSyncWeb.Graphql.Resolvers.AmenityResolver.update_amenity/3)
    end
  end

  object :amenity_queries do
    @desc "List all amenities"
    field :amenities, list_of(:amenity) do
      resolve(&HostSyncWeb.Graphql.Resolvers.AmenityResolver.list_all/3)
    end

    @desc "Get an amenity by ID"
    field :amenity, type: :amenity do
      arg :id, non_null(:id)

      resolve(&HostSyncWeb.Graphql.Resolvers.AmenityResolver.get_by_id/3)
    end
  end
end
