# NOTE: This file is auto generated by OpenAPI Generator 7.0.1 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule DockerEngineAPI.Model.ClusterVolumeInfo do
  @moduledoc """
  Information about the global status of the volume. 
  """

  @derive Jason.Encoder
  defstruct [
    :CapacityBytes,
    :VolumeContext,
    :VolumeID,
    :AccessibleTopology
  ]

  @type t :: %__MODULE__{
    :CapacityBytes => integer() | nil,
    :VolumeContext => %{optional(String.t) => String.t} | nil,
    :VolumeID => String.t | nil,
    :AccessibleTopology => [DockerEngineAPI.Model.Map.t] | nil
  }

  def decode(value) do
    value
  end
end

