defmodule HostSyncWeb.Graphql.Schema.UserSchema do
  @moduledoc """
  User GraphQL type, querys and mutations definitions.
  """
  alias HostSyncWeb.Graphql.Types.UserResolver

  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :classic

  object :user do
    field :id, :id
    field :name, :string
    field :email, :string

    field :inserted_at, :datetime
    field :updated_at, :datetime
  end

  object :session do
    field :token, :string
    field :user, :user
  end

  object :user_queries do
    @desc "The currently authenticated user."
    field :user, :user, resolve: &UserResolver.get_authenticated_user/2
  end
end
