defmodule HostSyncWeb.Graphql.Resolvers.AmenityResolver do
  @moduledoc """
  Module for resolving amenity fields.
  """

  alias HostSync.Entities.Amenity

  def create_amenity(_parent, args, _context) do
    args
    |> Amenity.create()
    |> handle_create_amenity()
  end

  def update_amenity(_parent, %{id: id} = args, _context) do
    id
    |> Amenity.get()
    |> Amenity.update(args)
    |> handle_update_amenity()
  end

  defp handle_create_amenity({:ok, amenity}), do: {:ok, amenity}
  defp handle_create_amenity({:error, changeset}), do: {:error, changeset}

  defp handle_update_amenity({:ok, amenity}), do: {:ok, amenity}
  defp handle_update_amenity({:error, changeset}), do: {:error, changeset}
end
