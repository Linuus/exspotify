defmodule ExSpotify.Albums do
  @moduledoc """
  Handles API requests related to Albums from the Spotify API.
  """

  import ExSpotify

  @base_endpoint "albums"

  @doc """
  The `find` function takes one or more Album IDs and fetches them from the
  Spotify API. The IDs can be passed in as a keyword list or a comma separated
  string.

  For more information about what options can be passed and return values, see:
  - https://developer.spotify.com/web-api/get-album/
  - https://developer.spotify.com/web-api/get-several-albums/

  ## Examples
      iex> ExSpotify.Albums.find("41MnTivkwTO3UUJ8DrqEJJ")
      {:ok, result}

      iex(2)> ExSpotify.Albums.find(["41MnTivkwTO3UUJ8DrqEJJ","6JWc4iAiJ9FjyK0B59ABb4"], market: "SE")
      {:ok, result}

      iex(3)> ExSpotify.Albums.find("notarealid")
      {:error, reason}
  """
  def find(_, params \\ [])
  def find([_|_] = ids, params) do
    ids = [ids: Enum.join(ids, ",")]
    get(@base_endpoint, [], params: ids ++ params)
    |> ExSpotify.Util.handle_spotify_response
  end
  def find(id, params) do
    IO.inspect params
    get("#{@base_endpoint}/#{id}", [], params: params)
    |> ExSpotify.Util.handle_spotify_response
  end

  @doc """
  The `tracks` function takes and album ID and some optional parameters and returns
  a list of tracks from the album.

  For more information about what options can be passed and return values, see:
  - https://developer.spotify.com/web-api/get-albums-tracks/

  ## Examples
      iex> ExSpotify.Albums.tracks("41MnTivkwTO3UUJ8DrqEJJ")
      {:ok, result}

      iex(2)> ExSpotify.Albums.tracks("41MnTivkwTO3UUJ8DrqEJJ", limit: 1, market: "SE")
      {:ok, result}

      iex(3)> ExSpotify.Albums.tracks("notarealid")
      {:error, reason}
  """
  def tracks(id, params \\ []) do
    get("#{@base_endpoint}/#{id}/tracks", [], params: params)
    |> ExSpotify.Util.handle_spotify_response
  end
end
