defmodule ExSpotify.Util do
  @moduledoc false

  @doc false
  def handle_spotify_response({:ok, response}) do
    cond do
      response.body["error"] -> {:error, response.body["error"]["message"]}
      true -> {:ok, response.body}
    end
  end
end
