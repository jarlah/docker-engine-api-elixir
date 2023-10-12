defmodule DockerEngineAPI.ConnectionTest do
  use ExUnit.Case

  test "can list images without specifying adapter (uses Hackney by default)" do
    {:ok, list} =
      DockerEngineAPI.Connection.new(base_url: "http+unix://%2Fvar%2Frun%2Fdocker.sock/v1.43")
      |> DockerEngineAPI.Api.Image.image_list()

    assert is_list(list)
  end

  test "cannot use connection without proper base_url (default baseurl is localhost url)" do
    {:error, :econnrefused} =
      DockerEngineAPI.Connection.new()
      |> DockerEngineAPI.Api.Image.image_list()
  end
end
