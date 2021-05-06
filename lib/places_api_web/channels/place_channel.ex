defmodule PlacesApiWeb.PlaceChannel do
  use PlacesApiWeb, :channel

  # @impl true
  # def join("place:lobby", payload, socket) do
  #   if authorized?(payload) do
  #     {:ok, socket}
  #   else
  #     {:error, %{reason: "unauthorized"}}
  #   end
  # end

  @impl true
  def join("place:" <> place_name, _params, socket) do
    IO.puts("*******************************")
    IO.puts("try to join")
    IO.puts("*******************************")
    {:ok, assign(socket, :place_name, place_name)}
  end

  @impl true
  def handle_in("message:add", payload, socket) do
    place_name = socket.assigns[:place_name]
    broadcast!(socket, "place:#{place_name}:new_message", payload)
    {:reply, :ok, socket}
  end


  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  # @impl true
  # def handle_in("ping", payload, socket) do
  #   {:reply, {:ok, payload}, socket}
  # end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (place:lobby).
  # @impl true
  # def handle_in("shout", payload, socket) do
  #   broadcast socket, "shout", payload
  #   {:noreply, socket}
  # end

  # Add authorization logic here as required.
  # defp authorized?(_payload) do
  #   true
  # end
end
