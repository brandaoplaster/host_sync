defmodule HostSync.Repo.Migrations.CreateUserTable do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string, null: false
      add :email, :string, null: false
      add :password_hash, :string, null: false
      add :profile_type, :string, null: false
      add :bio, :text

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
