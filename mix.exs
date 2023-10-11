defmodule DockerEngineAPI.Mixfile do
  use Mix.Project

  def project do
    [
      app: :docker_engine_api,
      version: "1.43.0",
      elixir: "~> 1.15",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      package: package(),
      description: """
      The Engine API is an HTTP API served by Docker Engine. It is the API the Docker client uses to communicate with the Engine, so everything the Docker client can do can be done with the API.  Most of the client&#39;s commands map directly to API endpoints (e.g. &#x60;docker ps&#x60; is &#x60;GET /containers/json&#x60;). The notable exception is running containers, which consists of several API calls.  # Errors  The API uses standard HTTP status codes to indicate the success or failure of the API call. The body of the response will be JSON in the following format:  &#x60;&#x60;&#x60; {   \&quot;message\&quot;: \&quot;page not found\&quot; } &#x60;&#x60;&#x60;  # Versioning  The API is usually changed in each release, so API calls are versioned to ensure that clients don&#39;t break. To lock to a specific version of the API, you prefix the URL with its version, for example, call &#x60;/v1.30/info&#x60; to use the v1.30 version of the &#x60;/info&#x60; endpoint. If the API version specified in the URL is not supported by the daemon, a HTTP &#x60;400 Bad Request&#x60; error message is returned.  If you omit the version-prefix, the current version of the API (v1.43) is used. For example, calling &#x60;/info&#x60; is the same as calling &#x60;/v1.43/info&#x60;. Using the API without a version-prefix is deprecated and will be removed in a future release.  Engine releases in the near future should support this version of the API, so your client will continue to work even if it is talking to a newer Engine.  The API uses an open schema model, which means server may add extra properties to responses. Likewise, the server will ignore any extra query parameters and request body properties. When you write clients, you need to ignore additional properties in responses to ensure they do not break when talking to newer daemons.   # Authentication  Authentication for registries is handled client side. The client has to send authentication details to various endpoints that need to communicate with registries, such as &#x60;POST /images/(name)/push&#x60;. These are sent as &#x60;X-Registry-Auth&#x60; header as a [base64url encoded](https://tools.ietf.org/html/rfc4648#section-5) (JSON) string with the following structure:  &#x60;&#x60;&#x60; {   \&quot;username\&quot;: \&quot;string\&quot;,   \&quot;password\&quot;: \&quot;string\&quot;,   \&quot;email\&quot;: \&quot;string\&quot;,   \&quot;serveraddress\&quot;: \&quot;string\&quot; } &#x60;&#x60;&#x60;  The &#x60;serveraddress&#x60; is a domain/IP without a protocol. Throughout this structure, double quotes are required.  If you have already got an identity token from the [&#x60;/auth&#x60; endpoint](#operation/SystemAuth), you can just pass this instead of credentials:  &#x60;&#x60;&#x60; {   \&quot;identitytoken\&quot;: \&quot;9cbaf023786cd7...\&quot; } &#x60;&#x60;&#x60;
      """,
      deps: deps()
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.3.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:tesla, "~> 1.7"},
      {:jason, "~> 1.4"},
      {:ex_doc, "~> 0.30", only: :dev, runtime: false},
      {:dialyxir, "~> 1.3", only: [:dev, :test], runtime: false}
    ]
  end

   defp package do
      [
        name: "docker_engine_api",
        files: ~w(.formatter.exs config lib mix.exs README* LICENSE*),
      ]
  end
end
