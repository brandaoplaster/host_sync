defmodule HostSyncWeb.Graphql.DataSource do
  @moduledoc """
  Integration betweem Ecto and Absinthe through Dataloader.
  """

  alias __MODULE__

  defmacro __using__(_opts) do
    quote do
      def context(ctx) do
        loader =
          Dataloader.new()
          |> Dataloader.add_source(DataSource, DataSource.data())

        Map.put(ctx, :loader, loader)
      end

      def plugins do
        [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
      end
    end
  end

  def data do
    Dataloader.Ecto.new(HostSync.Repo, query: &query/2)
  end

  defp query(queryable, _params), do: queryable
end
