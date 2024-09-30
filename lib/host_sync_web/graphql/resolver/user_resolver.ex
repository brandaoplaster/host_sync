defmodule HostSyncWeb.Graphql.Resolver.UserResolver do
  @moduledoc """
  Module for resolving user fields.
  """
  alias HostSync.Users

  @doc """
  Gets the currently authenticated user.
  """
  def get_authenticated_user(_args, context) do
    user =
      context
      |> get_user_id()

    case user do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end

  defp get_user_id(%{context: %{current_user: user_id}}) do
    user = Users.get_user!(user_id)

    case user do
      nil -> nil
      user -> user
    end
  end
end
