defmodule HostSyncWeb.Graphql.Resolvers.SessionResolver do
  @moduledoc """
  Module for resolving session fields.
  """

  alias HostSync.Entities.User

  def login(%{email: email, password: password}, _context) do
    User.authentication_user(email, password)
  end
end
