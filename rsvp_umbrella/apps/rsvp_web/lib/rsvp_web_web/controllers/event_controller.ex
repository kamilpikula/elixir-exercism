defmodule RsvpWebWeb.EventController do
  use RsvpWebWeb, :controller

  def show(conn, %{"id" => id}) do
    event = Rsvp.EventQueries.get_by_id(id)
    |> IO.inspect()

    render(conn, "details.html", event: event)
  end
end
