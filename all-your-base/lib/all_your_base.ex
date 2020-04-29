defmodule AllYourBase do
  @doc """
  Given a number in base a, represented as a sequence of digits, converts it to base b,
  or returns nil if either of the bases are less than 2
  """

  import Integer, only: [digits: 2, undigits: 2]

  @spec convert(list, integer, integer) :: list
  def convert(digits, base_a, base_b)
      when base_a > 1
      and base_b > 1
      and length(digits) > 0 do
    if digits_valid?(digits, base_a) do
      undigits(digits, base_a) |> digits(base_b)
    end
  end

  def convert(_, _, _), do: nil

  defp digits_valid?(digits, base_a) do
    digits == Enum.filter(digits, fn x ->
              x < base_a and x >= 0 end)
  end
end
