defmodule Gigasecond do
  @doc """
  Calculate a date one billion seconds after an input date.
  """
  @spec from({{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}) ::
          :calendar.datetime()

  def from({{year, month, day}, {hours, minutes, seconds}}) do

    time_zone = "Etc/UTC"
    from_date = Calendar.ISO.naive_datetime_to_string(year, month, day, hours, minutes, seconds, {0, 0})

    {:ok, datetime} = NaiveDateTime.from_iso8601(from_date)

    new_time = NaiveDateTime.add(datetime, 1_000_000_000)

    NaiveDateTime.to_erl(new_time)
  end
end
