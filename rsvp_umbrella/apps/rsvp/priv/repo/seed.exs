unless Rsvp.EventQueries.any? do
  Rsvp.EventQueries.create(
    Rsvp.Events.changeset(
      %Rsvp.Events{}, %{
        date: "2020-04-20 10:00:00",
        title: "Summer Codefest",
        location: "Warsaw, POL"
      }
    )
  )

  Rsvp.EventQueries.create(
    Rsvp.Events.changeset(
      %Rsvp.Events{}, %{
        date: "2020-04-19 21:00:00",
        title: "Spring Meetup",
        location: "Poznan, POL"
      }
    )
  )
end

