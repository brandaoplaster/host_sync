defmodule HostSyncWeb.Graphql.Schema.RoomSchema do
  @moduledoc """
  Room GraphQL type, querys and mutations definitions.
  """

  use Absinthe.Schema.Notation

  object :room do
    field :id, :id
    field :location, :string
    field :price, :integer
    field :description, :string
    field :available, :boolean
    field :room_type, :string
  end
end
