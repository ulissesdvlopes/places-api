defmodule PlacesApiWeb.PlaceView do
  use PlacesApiWeb, :view
  alias PlacesApiWeb.PlaceView

  def render("index.json", %{places: places}) do
    %{data: render_many(places, PlaceView, "place.json")}
  end

  def render("show.json", %{place: place}) do
    %{data: render_one(place, PlaceView, "place.json")}
  end

  def render("place.json", %{place: place}) do
    IO.inspect(place)
    %{id: place.id,
      name: place.name,
      private: place.private,
      owner: render_one(place.owner, PlacesApiWeb.UserView, "user.json", as: :user)
    }
  end
end
