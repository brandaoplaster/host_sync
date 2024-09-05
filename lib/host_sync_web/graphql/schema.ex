defmodule HostSyncWeb.Graphql.Schema do
  @moduledoc """
  Imports absinthe types, queries, mutations and dataloader callbacks
  """

  use Absinthe.Schema
  # use Absinthe.Relay.Schema, :classic

  import_types(HostSyncWeb.Graphql.Schema.Types)
  # HostSyncWeb.Graphql.Resolvers.UserResolver

  query do
    @desc "Get a list of all users"
    field :users, list_of(:user_type) do
      resolve(&HostSyncWeb.Graphql.Resolvers.UserResolver.users/3)
    end
  end
end
