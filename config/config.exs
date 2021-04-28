# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :places_api,
  ecto_repos: [PlacesApi.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :places_api, PlacesApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "YyjmjDmpchw0uKucNprod1E44eOWLZaLL1eK/VC4jnjwyd4YE8Z9TjzBcKADrdfN",
  render_errors: [view: PlacesApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: PlacesApi.PubSub,
  live_view: [signing_salt: "A9/4FlB+"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
