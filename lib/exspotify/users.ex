defmodule ExSpotify.Users do
  @moduledoc """
  Handles API requests related to Users from the Spotify API.
  """

  import ExSpotify

  @base_endpoint "users"

  @doc """
  The `find` function takes a Spotify User IDs and fetches the user profile from
  the Spotify API.

  For more information about what options can be passed and return values, see:
  - https://developer.spotify.com/web-api/get-users-profile/

  ## Examples
      iex> ExSpotify.Users.find("tuggareutangranser")
      {:ok, result}

      iex(2)> ExSpotify.Users.find("notarealuserid")
      {:error, reason}
  """
  def find(id) do
    get("#{@base_endpoint}/#{id}")
    |> ExSpotify.Util.handle_spotify_response
  end
end
