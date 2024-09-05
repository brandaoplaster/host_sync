defmodule HostSyncWeb.Graphql.Schema.Types do
  use Absinthe.Schema.Notation

  import_types(HostSyncWeb.Graphql.Schema.UserType)
end
