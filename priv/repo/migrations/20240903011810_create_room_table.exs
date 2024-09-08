defmodule HostSync.Repo.Migrations.CreateRoomTable do
  use Ecto.Migration

  def change do
    create table(:rooms, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :host_id, references(:users, type: :uuid, on_delete: :delete_all), null: false
      add :location, :string, null: false
      add :price, :integer, null: false
      add :description, :text
      add :available, :boolean, default: true, null: false
      add :room_type, :string, null: false

      timestamps()
    end

    create index(:rooms, [:host_id])
  end
end
