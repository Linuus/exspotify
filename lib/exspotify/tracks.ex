defmodule ExSpotify.Tracks do
  @moduledoc """
  Handles API requests to fetch Tracks from the Spotify API.
  """

  import ExSpotify

  @base_endpoint "tracks"

  @doc """
  The `find` function takes one or more Track IDs and fetches them from the
  Spotify API. The IDs can be passed in as a keyword list or a comma separated
  string.

  For more information about what options can be passed and return values, see:
  - https://developer.spotify.com/web-api/get-track/
  - https://developer.spotify.com/web-api/get-several-tracks/

  ## Examples
      iex> ExSpotify.Tracks.find("0eGsygTp906u18L0Oimnem")
      {:ok, result}

      iex(2)> ExSpotify.Tracks.find(["7ouMYWpwJ422jRcDASZB7P","4VqPOruhp5EdPBeR92t6lQ"], market: "SE")
      {:ok, result}

      iex(3)> ExSpotify.Tracks.find("notarealid")
      {:error, reason}
  """
  def find(_, params \\ [])
  def find([_|_] = ids, params) do
    ids = [ids: Enum.join(ids, ",")]
    get(@base_endpoint, [], params: ids ++ params)
    |> ExSpotify.Util.handle_spotify_response
  end
  def find(id, params) do
    get("#{@base_endpoint}/#{id}", [], params: params)
    |> ExSpotify.Util.handle_spotify_response
  end
end
