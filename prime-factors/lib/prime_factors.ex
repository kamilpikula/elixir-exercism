defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest.
  """
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(1), do: []
  def factors_for(number) do
    check_factor(number, [])
  end

  defp check_factor(number, arr) when number >= 2 do
    factor = Enum.filter(2..number, fn x -> rem(number, x) == 0 end)
      |> List.first()

    check_factor(div(number, factor), [factor | arr])
  end

  defp check_factor(_, arr), do: Enum.sort(arr)
end
