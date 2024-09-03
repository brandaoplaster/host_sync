defmodule HostSync.Repo.Migrations.CreateAmenityTable do
  use Ecto.Migration

  def change do
    create table(:amenities, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string, null: false
      add :description, :text

      timestamps()
    end

    create unique_index(:amenities, [:name])
  end
end
