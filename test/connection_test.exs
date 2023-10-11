defmodule DockerEngineAPI.ConnectionTest do
  use ExUnit.Case

  test "can list images" do
    {:ok, list} = DockerEngineAPI.Connection.new(
      base_url: "http+unix://%2Fvar%2Frun%2Fdocker.sock/v1.43"
    )
    |> DockerEngineAPI.Api.Image.image_list()
    assert is_list(list)
  end
end
