defmodule ExSpotify.Artists do
  @moduledoc """
  Handles API requests related to Artists from the Spotify API.
  """

  import ExSpotify

  @base_endpoint "artists"

  @doc """
  The `find` function takes one or more Artist IDs and fetches them from the
  Spotify API. The IDs can be passed in as a keyword list or a comma separated
  string.

  For more information about what options can be passed and return values, see:
  - https://developer.spotify.com/web-api/get-artist/
  - https://developer.spotify.com/web-api/get-several-artists/

  ## Examples
      iex> ExSpotify.Artists.find("0oSGxfWSnnOXhD2fKuz2Gy")
      {:ok, result}

      iex(2)> ExSpotify.Artists.find(["0oSGxfWSnnOXhD2fKuz2Gy","40oSGxfWSnnOXhD2fKuz2Gy"], market: "SE")
      {:ok, result}

      iex(3)> ExSpotify.Artists.find("notarealid")
      {:error, reason}
  """
  def find([_|_] = ids) do
    ids = [ids: Enum.join(ids, ",")]
    get(@base_endpoint, [], params: ids)
    |> ExSpotify.Util.handle_spotify_response
  end
  def find(id) do
    get("#{@base_endpoint}/#{id}")
    |> ExSpotify.Util.handle_spotify_response
  end

  @doc """
  The `albums` function takes an Artist ID and some optional parameters and fetches
  the artist's albums.

  For more information about what options can be passed and return values, see:
  - https://developer.spotify.com/web-api/get-artists-albums/

  ## Examples
      iex> ExSpotify.Artists.albums("0oSGxfWSnnOXhD2fKuz2Gy")
      {:ok, result}

      iex(2)> ExSpotify.Artists.albums("0oSGxfWSnnOXhD2fKuz2Gy", limit: 4, market: "SE")
      {:ok, result}

      iex(3)> ExSpotify.Artists.albums("notarealid")
      {:error, reason}
  """
  def albums(id, params \\ []) do
    get("#{@base_endpoint}/#{id}/albums", [], params: params)
    |> ExSpotify.Util.handle_spotify_response
  end

  @doc """
  The `related_artists` function takes an Artist ID and fetches similar artists.

  For more information about what options can be passed and return values, see:
  - https://developer.spotify.com/web-api/get-related-artists/

  ## Examples
      iex> ExSpotify.Artists.related_artists("0oSGxfWSnnOXhD2fKuz2Gy")
      {:ok, result}

      iex(2)> ExSpotify.Artists.related_artists("notarealid")
      {:error, reason}
  """
  def related_artists(id) do
    get("#{@base_endpoint}/#{id}/related-artists")
    |> ExSpotify.Util.handle_spotify_response
  end

  @doc """
  The `top_tracks` function takes an Artist ID and a country and fetches the artist's top tracks
  for that country.

  For more information about what options can be passed and return values, see:
  - https://developer.spotify.com/web-api/get-artists-top-tracks/

  ## Examples
      iex> ExSpotify.Artists.top_tracks("0oSGxfWSnnOXhD2fKuz2Gy", "SE")
      {:ok, result}

      iex(2)> ExSpotify.Artists.top_tracks("notarealid", "SE")
      {:error, reason}
  """
  def top_tracks(id, country) do
    get("#{@base_endpoint}/#{id}/top-tracks", [], params: [country: country])
    |> ExSpotify.Util.handle_spotify_response
  end
end
