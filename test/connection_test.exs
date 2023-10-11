defmodule DockerEngineAPI.ConnectionTest do
  use ExUnit.Case

  test "can list images with hackney adapter" do
    {:ok, list} = DockerEngineAPI.Connection.new(
      base_url: "http+unix://%2Fvar%2Frun%2Fdocker.sock/v1.43",
      adapter: Tesla.Adapter.Hackney
    )
    |> DockerEngineAPI.Api.Image.image_list()
    assert is_list(list)
  end

  test "doesnt work without adapter" do
    {:error, {:bad_scheme, ~c"http+unix"}} = DockerEngineAPI.Connection.new(
      base_url: "http+unix://%2Fvar%2Frun%2Fdocker.sock/v1.43"
    )
    |> DockerEngineAPI.Api.Image.image_list()
  end
end
