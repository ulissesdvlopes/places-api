defmodule PlacesApiWeb.PlaceController do
  use PlacesApiWeb, :controller

  alias PlacesApi.Places
  alias PlacesApi.Places.Place

  action_fallback PlacesApiWeb.FallbackController

  def index(conn, _params) do
    places = Places.list_places()
    render(conn, "index.json", places: places)
  end

  def create(conn, params) do
    with {:ok, %Place{} = place} <- Places.create_place(params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.place_path(conn, :show, place))
      |> render("show.json", place: place)
    end
  end

  def show(conn, %{"id" => id}) do
    place = Places.get_place!(id)
    render(conn, "show.json", place: place)
  end

  def update(conn, %{"id" => id, "place" => place_params}) do
    place = Places.get_place!(id)

    with {:ok, %Place{} = place} <- Places.update_place(place, place_params) do
      render(conn, "show.json", place: place)
    end
  end

  def delete(conn, %{"id" => id}) do
    place = Places.get_place!(id)

    with {:ok, %Place{}} <- Places.delete_place(place) do
      send_resp(conn, :no_content, "")
    end
  end
end
