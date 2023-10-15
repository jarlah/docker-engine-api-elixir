# DockerEngineAPI

[![Hex.pm](https://img.shields.io/hexpm/v/ex_docker_engine_api.svg)]()

The Engine API is an HTTP API served by Docker Engine. It is the API the Docker client uses to communicate with the Engine, so everything the Docker client can do can be done with the API.  Most of the client&#39;s commands map directly to API endpoints (e.g. &#x60;docker ps&#x60; is &#x60;GET /containers/json&#x60;). The notable exception is running containers, which consists of several API calls.  # Errors  The API uses standard HTTP status codes to indicate the success or failure of the API call. The body of the response will be JSON in the following format:  &#x60;&#x60;&#x60; {   \&quot;message\&quot;: \&quot;page not found\&quot; } &#x60;&#x60;&#x60;  # Versioning  The API is usually changed in each release, so API calls are versioned to ensure that clients don&#39;t break. To lock to a specific version of the API, you prefix the URL with its version, for example, call &#x60;/v1.30/info&#x60; to use the v1.30 version of the &#x60;/info&#x60; endpoint. If the API version specified in the URL is not supported by the daemon, a HTTP &#x60;400 Bad Request&#x60; error message is returned.  If you omit the version-prefix, the current version of the API (v1.43) is used. For example, calling &#x60;/info&#x60; is the same as calling &#x60;/v1.43/info&#x60;. Using the API without a version-prefix is deprecated and will be removed in a future release.  Engine releases in the near future should support this version of the API, so your client will continue to work even if it is talking to a newer Engine.  The API uses an open schema model, which means server may add extra properties to responses. Likewise, the server will ignore any extra query parameters and request body properties. When you write clients, you need to ignore additional properties in responses to ensure they do not break when talking to newer daemons.   # Authentication  Authentication for registries is handled client side. The client has to send authentication details to various endpoints that need to communicate with registries, such as &#x60;POST /images/(name)/push&#x60;. These are sent as &#x60;X-Registry-Auth&#x60; header as a [base64url encoded](https://tools.ietf.org/html/rfc4648#section-5) (JSON) string with the following structure:  &#x60;&#x60;&#x60; {   \&quot;username\&quot;: \&quot;string\&quot;,   \&quot;password\&quot;: \&quot;string\&quot;,   \&quot;email\&quot;: \&quot;string\&quot;,   \&quot;serveraddress\&quot;: \&quot;string\&quot; } &#x60;&#x60;&#x60;  The &#x60;serveraddress&#x60; is a domain/IP without a protocol. Throughout this structure, double quotes are required.  If you have already got an identity token from the [&#x60;/auth&#x60; endpoint](#operation/SystemAuth), you can just pass this instead of credentials:  &#x60;&#x60;&#x60; {   \&quot;identitytoken\&quot;: \&quot;9cbaf023786cd7...\&quot; } &#x60;&#x60;&#x60; 

## Building

To install the required dependencies and to build the elixir project, run:

```console
mix local.hex --force
mix do deps.get, compile
```

## Installation

If [available in Hex][], the package can be installed by adding `docker_engine_api` to
your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:docker_engine_api, "~> 1.43"}]
end
```

Documentation can be generated with [ExDoc][] and published on [HexDocs][]. Once published, the docs can be found at
[https://hexdocs.pm/docker_engine_api][docs].

## Configuration

You can override the URL of your server (e.g. if you have a separate development and production server in your
configuration files).

```elixir
config :docker_engine_api, base_url: "http://localhost/v1.43"
```

Multiple clients for the same API with different URLs can be created passing different `base_url`s when calling
`DockerEngineAPI.Connection.new/1`:

```elixir
client = DockerEngineAPI.Connection.new(base_url: "http://localhost/v1.43")
```

[exdoc]: https://github.com/elixir-lang/ex_doc
[hexdocs]: https://hexdocs.pm
[available in hex]: https://hex.pm/docs/publish
[docs]: https://hexdocs.pm/docker_engine_api
