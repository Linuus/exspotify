defmodule ExSpotify do
  @moduledoc """
  ExSpotify is an API library for the Spotify Web API.

  https://developer.spotify.com/web-api/
  """

  use HTTPoison.Base

  @doc false
  def process_url(url) do
    "https://api.spotify.com/v1/" <> url
  end

  @doc false
  def process_response_body(body) do
    Poison.decode!(body)
  end
end
