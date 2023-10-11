# NOTE: This file is auto generated by OpenAPI Generator 7.0.1 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule DockerEngineAPI.Model.Mount do
  @moduledoc """
  
  """

  @derive Jason.Encoder
  defstruct [
    :Target,
    :Source,
    :Type,
    :ReadOnly,
    :Consistency,
    :BindOptions,
    :VolumeOptions,
    :TmpfsOptions
  ]

  @type t :: %__MODULE__{
    :Target => String.t | nil,
    :Source => String.t | nil,
    :Type => String.t | nil,
    :ReadOnly => boolean() | nil,
    :Consistency => String.t | nil,
    :BindOptions => DockerEngineAPI.Model.MountBindOptions.t | nil,
    :VolumeOptions => DockerEngineAPI.Model.MountVolumeOptions.t | nil,
    :TmpfsOptions => DockerEngineAPI.Model.MountTmpfsOptions.t | nil
  }

  alias DockerEngineAPI.Deserializer

  def decode(value) do
    value
     |> Deserializer.deserialize(:BindOptions, :struct, DockerEngineAPI.Model.MountBindOptions)
     |> Deserializer.deserialize(:VolumeOptions, :struct, DockerEngineAPI.Model.MountVolumeOptions)
     |> Deserializer.deserialize(:TmpfsOptions, :struct, DockerEngineAPI.Model.MountTmpfsOptions)
  end
end

