defmodule PlacesApi.Repo do
  use Ecto.Repo,
    otp_app: :places_api,
    adapter: Ecto.Adapters.Postgres
end
