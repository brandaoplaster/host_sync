defmodule HostSync.Entities.Profile do
  @moduledoc """
  Profile public Entity
  """

  alias HostSync.Accounts.Profile
  use HostSync.EntityManager, schema: Profile
end
