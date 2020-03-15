defmodule TwelveDays do
  @days %{
    1 => {:first, "and a Partridge in a Pear Tree."},
    2 => {:second, "two Turtle Doves"},
    3 => {:third, "three French Hens"},
    4 => {:fourth, "four Calling Birds"},
    5 => {:fifth, "five Gold Rings"},
    6 => {:sixth, "six Geese-a-Laying"},
    7 => {:seventh, "seven Swans-a-Swimming"},
    8 => {:eight, "eight Maids-a-Milking"},
    9 => {:ninth, "nine Ladies Dancing"},
    10 => {:tenth, "ten Lords-a-Leaping"},
    11 => {:eleventh, "eleven Pipers Piping"},
    12 => {:twelfth, "twelve Drummers Drumming"}
  }
  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """
  @spec verse(number :: integer) :: String.t()
  def verse(1) do
    "On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree."
  end

  def verse(number) when number >= 1 do
    {numerator, gift} = Map.get(@days, number)
    Enum.take(@days, number - 1)
    |> Enum.reverse()
    |> Enum.reduce("On the #{numerator} day of Christmas my true love gave to me: #{gift}", fn {_number, {_, gift_day}}, acc -> acc <> ", #{gift_day}" end)
    |> String.trim()
  end

  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) do
  end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing() :: String.t()
  def sing do
  end
end
