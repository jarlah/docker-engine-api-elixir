# NOTE: This file is auto generated by OpenAPI Generator 7.0.1 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule DockerEngineAPI.Model.Runtime do
  @moduledoc """
  Runtime describes an [OCI compliant](https://github.com/opencontainers/runtime-spec) runtime.  The runtime is invoked by the daemon via the `containerd` daemon. OCI runtimes act as an interface to the Linux kernel namespaces, cgroups, and SELinux. 
  """

  @derive Jason.Encoder
  defstruct [
    :path,
    :runtimeArgs
  ]

  @type t :: %__MODULE__{
    :path => String.t | nil,
    :runtimeArgs => [String.t] | nil
  }

  def decode(value) do
    value
  end
end

