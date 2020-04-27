defmodule RsvpWebWeb.EventView do
  use RsvpWebWeb, :view

  def format_date(date) do
    {y, m, d} = DateTime.to_date(date) |> Date.to_erl()
    "#{m}/#{d}/#{y}"
  end
end
