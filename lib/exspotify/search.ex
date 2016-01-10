defmodule ExSpotify.Search do
  @moduledoc """
  Handles API requests related to Searching the Spotify API.
  """

  import ExSpotify

  @base_endpoint "search"

  @doc """
  The `search` function takes a query, one or more types and some optional parameters
  and searches the Spotify API. The `type` argument can be a comma separated string or
  a list of strings. Valid types are `album`, `artist`, `playlist` and `track`.

  For more information about what options can be passed and return values, see:
  - https://developer.spotify.com/web-api/search-item/

  ## Examples
      iex> ExSpotify.Search.search("abba", "artist")
      {:ok, result}

      iex> ExSpotify.Search.search("doom metal", ["album", "playlist"], limit: 4)
      {:ok, result}
  """
  def search(query, type, params \\ [])
  def search(query, type, params) when is_list(type) do
    search(query, Enum.join(type, ","), params)
  end
  def search(query, type, params) do
    params = [q: query, type: type]
    |> Dict.merge(params)
    get(@base_endpoint, [], params: params)
  end
end
