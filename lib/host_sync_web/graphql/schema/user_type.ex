defmodule HostSyncWeb.Graphql.Schema.UserType do
  use Absinthe.Schema.Notation

  @desc "A user type"
  object :user_type do
    field(:id, :id)
    field(:name, :string)
    field(:email, :string)
    field(:password, :string)
  end
end
