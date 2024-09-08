defmodule HostSync.Amenities do
  @moduledoc """
  The Amenities context.
  """

  import Ecto.Query, warn: false
  alias HostSync.Accommodations.Amenity
  alias HostSync.Repo

  @doc """
  Returns the list of Amenities.

  ## Examples

      iex> list_amenities()
      [%Amenity{}, ...]

  """
  def list_amenities do
    Repo.all(Amenity)
  end

  @doc """
  Gets a single Amenity.

  Raises `Ecto.NoResultsError` if the Amenity does not exist.

  ## Examples

      iex> get_amenity!(123)
      %Amenity{}

      iex> get_amenity!(456)
      ** (Ecto.NoResultsError)

  """
  def get_amenity!(id), do: Repo.get!(Amenity, id)

  @doc """
  Creates a Amenity.

  ## Examples

      iex> create_amenity(%{field: value})
      {:ok, %Amenity{}}

      iex> create_amenity(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_amenity(attrs \\ %{}) do
    %Amenity{}
    |> Amenity.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a Amenity.

  ## Examples

      iex> update_amenity(Amenity, %{field: new_value})
      {:ok, %Amenity{}}

      iex> update_amenity(Amenity, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_amenity(%Amenity{} = amenity, attrs) do
    amenity
    |> Amenity.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Amenity.

  ## Examples

      iex> delete_amenity(Amenity)
      {:ok, %Amenity{}}

      iex> delete_amenity(Amenity)
      {:error, %Ecto.Changeset{}}

  """
  def delete_amenity(%Amenity{} = amenity) do
    Repo.delete(amenity)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking Amenity changes.

  ## Examples

      iex> change_amenity(Amenity)
      %Ecto.Changeset{data: %Amenity{}}

  """
  def change_amenity(%Amenity{} = amenity, attrs \\ %{}) do
    Amenity.changeset(amenity, attrs)
  end
end
