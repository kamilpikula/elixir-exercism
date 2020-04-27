defmodule RsvpWebWeb.EventViewTest do
  use RsvpWebWeb.ConnCase, async: true

  @tag current: true
  test "Should convert date to a M/D/YY format" do
    date = DateTime.to_date(~U[2020-04-27 11:54:12.565000Z])
      |> Date.to_erl()
    formatted = RsvpWebWeb.EventView.format_date(date)
    assert formatted == "04/27/2020"
  end
end
