defmodule HostSyncWeb.Graphql.Schema.UserSchema do
  @moduledoc """
  User GraphQL type, querys and mutations definitions.
  """

  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :classic

  alias HostSyncWeb.Graphql.Resolvers.{SessionResolver, UserResolver}

  object :user do
    field :id, :id
    field :name, :string
    field :email, :string

    field :created_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  input_object :user_input do
    field :email, non_null(:string)
    field :name, non_null(:string)
    field :password, non_null(:string)
  end

  object :user_mutations do
    field :create_user, :user do
      arg :input, non_null(:user_input)

      resolve(&UserResolver.create_user/3)
    end

    field :update_user, :user do
      arg :id, non_null(:id)
      arg :input, non_null(:user_input)

      resolve(&UserResolver.update_user/3)
    end

    field :login, type: :session do
      arg :email, non_null(:string)
      arg :password, non_null(:string)

      resolve(&SessionResolver.login/2)
    end
  end

  object :session do
    field :token, :string
    field :user, :user
  end
end
