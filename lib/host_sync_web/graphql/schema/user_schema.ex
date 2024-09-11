defmodule HostSyncWeb.Graphql.Schema.UserSchema do
  @moduledoc """
  User GraphQL type, querys and mutations definitions.
  """

  use Absinthe.Schema.Notation

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
end
