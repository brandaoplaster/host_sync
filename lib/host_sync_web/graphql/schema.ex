defmodule HostSyncWeb.Graphql.Schema do
  @moduledoc """
  Imports absinthe types, queries, mutations and dataloader callbacks
  """

  use Absinthe.Schema
  use Absinthe.Relay.Schema, :classic
  use HostSyncWeb.Graphql.DataSource

  import_types(Absinthe.Type.Custom)
  import_types(HostSyncWeb.Graphql.Schema.UserSchema)
  import_types(HostSyncWeb.Graphql.Schema.AmenitySchema)
  import_types(HostSyncWeb.Graphql.Schema.ProfileSchema)
  import_types(HostSyncWeb.Graphql.Schema.RoomSchema)

  @desc "The root of query operations"
  query do
    import_fields(:user_queries)
    import_fields(:profile_queries)
  end

  @desc "The root of mutation operations"
  mutation do
    import_fields(:profile_mutations)
  end
end
