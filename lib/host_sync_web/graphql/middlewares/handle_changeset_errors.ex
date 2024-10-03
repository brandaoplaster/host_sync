defmodule HostSyncWeb.Graphql.Middlewares.HandleChangesetErrors do
  @moduledoc """
  Handle changeset errors
  """
  @behaviour Absinthe.Middleware

  def call(resolution, _) do
    %{resolution | errors: Enum.flat_map(resolution.errors, &handle_error/1)}
  end

  defp handle_error(%Ecto.Changeset{} = changeset) do
    changeset
    |> Ecto.Changeset.traverse_errors(fn {err, _opts} -> err end)
    |> Enum.flat_map(fn
      {_k, [_, v]} ->
        Enum.to_list(v)
        |> Enum.map(fn {_field, error} -> "#{error}" end)

      {field, error} ->
        ["#{field} #{error}"]
    end)
  end

  defp handle_error(error), do: [error]
end
