defmodule HostSync.Repo.Migrations.CreateRoomAmenityTable do
  use Ecto.Migration

  def change do
    create table(:rooms_amenities, primary_key: false) do
      add :room_id, references(:rooms, type: :uuid, on_delete: :delete_all), null: false
      add :amenity_id, references(:amenities, type: :uuid, on_delete: :delete_all), null: false
    end

    create index(:rooms_amenities, [:room_id])
    create index(:rooms_amenities, [:amenity_id])
    create unique_index(:rooms_amenities, [:room_id, :amenity_id])
  end
end
