defmodule HostSync.Entities.User do
  @moduledoc """
  User public Entity
  """

  alias HostSync.Schemas.User
  use HostSync.EntityManager, schema: User
end
