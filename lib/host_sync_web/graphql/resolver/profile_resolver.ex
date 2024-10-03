defmodule HostSyncWeb.Graphql.Resolver.ProfileResolver do
  @moduledoc """
  Module for resolving profile fields.
  """

  alias HostSync.Entities.Profile

  def create_profile(_parent, args, _context) do
    args
    |> Profile.create()
    |> handle_create_profile()
  end

  def update_profile(_parent, %{id: id} = args, _context) do
    id
    |> Profile.get()
    |> Profile.update(args)
    |> handle_update_profile()
  end

  def get_profile(_parent, %{id: id}, _context) do
    case Profile.get(id) do
      nil -> {:error, nil}
      profile -> {:ok, profile}
    end
  end

  defp handle_create_profile({:ok, profile}), do: {:ok, profile}
  defp handle_create_profile({:error, changeset}), do: {:error, changeset}

  defp handle_update_profile({:ok, profile}), do: {:ok, profile}
  defp handle_update_profile({:error, changeset}), do: {:error, changeset}
end
