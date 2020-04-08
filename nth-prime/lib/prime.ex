defmodule Prime do
  import Stream, only: [interval: 1, drop: 2, filter: 2]
  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer

  def nth(0), do: raise ArgumentError
  def nth(count) do
    interval(1) |> drop(2) |> filter(&is_prime/1) |> Enum.take(count) |> List.last()
  end

  defp is_prime(x), do: (2..x |> Enum.filter(fn a -> rem(x, a) == 0 end) |> length()) == 1
end
