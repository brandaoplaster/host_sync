defmodule HostSyncWeb.Graphql.Resolvers.UserResolver do
  alias HostSync.Accounts

  def users(_, _, _) do
    {:ok, [%{id: 1, name: "John Doe", email: "john@example.com", password: "secret"}]}
  end
end
