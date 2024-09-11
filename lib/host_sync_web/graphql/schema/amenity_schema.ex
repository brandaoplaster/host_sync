defmodule HostSyncWeb.Graphql.Schema.AmenitySchema do
  @moduledoc """
  Amenity GraphQL type, querys and mutations definitions.
  """

  use Absinthe.Schema.Notation

  object :amenity do
    field :id, :id
    field :name, :string
    field :description, :integer
  end
end
