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
end
