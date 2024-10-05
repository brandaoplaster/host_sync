defmodule HostSyncWeb.Graphql.Resolvers.UserResolver do
  @moduledoc """
  Module for resolving user fields.
  """
  alias HostSync.Entities.User

  @doc """
  Gets the currently authenticated user.
  """
  def create_user(_parent, args, _context) do
    args
    |> User.create()
    |> handle_create_user
  end

  def update_user(_parent, %{id: id} = args, _context) do
    id
    |> User.get()
    |> User.update(args)
    |> handle_update_user
  end

  defp handle_create_user({:ok, user}), do: {:ok, user}
  defp handle_create_user({:error, changeset}), do: {:error, changeset}

  defp handle_update_user({:ok, user}), do: {:ok, user}
  defp handle_update_user({:error, changeset}), do: {:error, changeset}
end
