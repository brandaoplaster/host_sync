defmodule HostSync.Repo.Migrations.CreateProfileTable do
  use Ecto.Migration

  def change do
    create table(:profiles, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :max_price, :integer
      add :guest_occupation, :string
      add :is_smoker, :boolean, default: false
      add :has_pets, :boolean, default: false
      add :pet_friendly, :boolean, default: false
      add :nationality, :string
      add :preferred_room_type, :string
      add :birthdate, :date

      add :user_id, references(:users, type: :uuid, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:profiles, [:user_id])
  end
end
