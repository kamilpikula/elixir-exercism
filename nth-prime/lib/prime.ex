defmodule Prime do
  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer

  def nth(count) when count < 1 do
    raise ArgumentError
  end
  def nth(count) do
    Stream.interval(1) |> Stream.drop(2) |> Stream.filter(&is_prime/1) |> Enum.take(count) |> List.last()
  end

  def is_prime(x), do: (2..x |> Enum.filter(fn a -> rem(x, a) == 0 end) |> length()) == 1
end
