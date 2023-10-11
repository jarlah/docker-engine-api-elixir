# NOTE: This file is auto generated by OpenAPI Generator 7.0.1 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule DockerEngineAPI.Model.ImageInspectMetadata do
  @moduledoc """
  Additional metadata of the image in the local cache. This information is local to the daemon, and not part of the image itself. 
  """

  @derive Jason.Encoder
  defstruct [
    :LastTagTime
  ]

  @type t :: %__MODULE__{
    :LastTagTime => String.t | nil
  }

  def decode(value) do
    value
  end
end

