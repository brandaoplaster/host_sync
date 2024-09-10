defmodule HostSync.Entities.User do
  @moduledoc """
  User public Entity
  """

  alias HostSync.Accounts.User
  use HostSync.EntityManager, schema: User
end
