defmodule Gigasecond do
  @gigasecond 1_000_000_000
  @doc """
  Calculate a date one billion seconds after an input date.
  """
  @spec from({{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}) ::
          :calendar.datetime()

  def from({{year, month, day}, {hours, minutes, seconds}}) do
    {:ok, from_date} = NaiveDateTime.from_erl({{year, month, day}, {hours, minutes, seconds}})

    new_time = NaiveDateTime.add(from_date, @gigasecond)

    NaiveDateTime.to_erl(new_time)
  end
end
