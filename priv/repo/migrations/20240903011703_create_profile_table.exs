defmodule HostSync.Repo.Migrations.CreateProfileTable do
  use Ecto.Migration

  def change do
    create table(:profiles, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :user_id, references(:users, type: :uuid, on_delete: :delete_all), null: false
      add :preferred_location, :string
      add :max_price, :decimal

      timestamps()
    end

    create index(:profiles, [:user_id])
  end
end
