defmodule HostSync.Auth.Guardian do
  @moduledoc """
  Authentication module for handling JWT token generation and validation
  """

  @behaviour Plug
  import Plug.Conn

  alias Guardian.Plug

  @impl true
  def init(opts), do: opts

  @impl true
  def call(conn, _) do
    context = %{current_token: Plug.current_token(conn)}

    case Plug.current_resource(conn) do
      nil ->
        put_private(conn, :absinthe, %{context: context})

      user_id ->
        put_private(conn, :absinthe, %{context: put_user_id(context, user_id)})
    end
  end

  defp put_user_id(context, user_id) do
    Map.put(context, :current_user, user_id)
  end
end
