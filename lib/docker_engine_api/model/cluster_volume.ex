# NOTE: This file is auto generated by OpenAPI Generator 7.0.1 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule DockerEngineAPI.Model.ClusterVolume do
  @moduledoc """
  Options and information specific to, and only present on, Swarm CSI cluster volumes. 
  """

  @derive Jason.Encoder
  defstruct [
    :ID,
    :Version,
    :CreatedAt,
    :UpdatedAt,
    :Spec,
    :Info,
    :PublishStatus
  ]

  @type t :: %__MODULE__{
    :ID => String.t | nil,
    :Version => DockerEngineAPI.Model.ObjectVersion.t | nil,
    :CreatedAt => String.t | nil,
    :UpdatedAt => String.t | nil,
    :Spec => DockerEngineAPI.Model.ClusterVolumeSpec.t | nil,
    :Info => DockerEngineAPI.Model.ClusterVolumeInfo.t | nil,
    :PublishStatus => [DockerEngineAPI.Model.ClusterVolumePublishStatusInner.t] | nil
  }

  alias DockerEngineAPI.Deserializer

  def decode(value) do
    value
     |> Deserializer.deserialize(:Version, :struct, DockerEngineAPI.Model.ObjectVersion)
     |> Deserializer.deserialize(:Spec, :struct, DockerEngineAPI.Model.ClusterVolumeSpec)
     |> Deserializer.deserialize(:Info, :struct, DockerEngineAPI.Model.ClusterVolumeInfo)
     |> Deserializer.deserialize(:PublishStatus, :list, DockerEngineAPI.Model.ClusterVolumePublishStatusInner)
  end
end

