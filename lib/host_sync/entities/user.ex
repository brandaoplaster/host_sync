defmodule HostSync.Entities.User do
  @moduledoc """
  User public Entity
  """

  alias HostSync.Repo
  alias HostSync.Schemas.User
  use HostSync.EntityManager, schema: User

  def authentication_user(email, password) do
    email
    |> get_by_email()
    |> verify_credentials(password)
  end

  def get_by_email(email) do
    case Repo.get_by(User, email: email) do
      nil -> {:error, "Invalid credentials"}
      user -> {:ok, user}
    end
  end

  defp verify_credentials({:ok, user}, password) do
    %User{password_hash: password_hash} = user

    case Argon2.verify_pass(password, password_hash) do
      true -> {:ok, user}
      false -> {:error, "Invalid credentials"}
    end
  end

  defp verify_credentials({:error, _reason} = error, _password) do
    Argon2.no_user_verify()
    error
  end
end
