defmodule HostSyncWeb.Graphql.Resolvers.RoomResolver do
  @moduledoc """
  Module for resolving room fields.
  """
  alias HostSync.Entities.Room

  def get_all_rooms(_args, _context) do
    {:ok, Room.all()}
  end

  def create_room(_parent, args, _context) do
    args
    |> Room.create()
    |> handle_create_room
  end

  def update_room(_parent, %{id: id} = args, _context) do
    id
    |> Room.get()
    |> Room.update(args)
    |> handle_update_room
  end

  defp handle_create_room({:ok, room}), do: {:ok, room}
  defp handle_create_room({:error, changeset}), do: {:error, changeset}

  defp handle_update_room({:ok, room}), do: {:ok, room}
  defp handle_update_room({:error, changeset}), do: {:error, changeset}
end
