defmodule HostSyncWeb.Graphql.Types.RoomResolver do
  @moduledoc """
  Module for resolving room fields.
  """
  alias HostSync.Entities.Room

  def get_all_rooms(_args, _context) do
    {:ok, Room.all()}
  end

  def create_room(args, context) do
    Room.create(args)
  end
end
