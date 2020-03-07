defmodule Fizzbuzz do

  defp count(0) do
    []
  end

  defp count(number) when rem(number, 3) == 0 and rem(number, 5) == 0 do
    ["fizzbuzz" | count(number - 1)]
  end

  defp count(number) when rem(number, 3) == 0 do
    ["fizz" | count(number - 1)]
  end

  defp count(number) when rem(number, 5) == 0 do
    ["buzz" | count(number - 1)]
  end

  defp count(number) do
    [Integer.to_string(number) | count(number - 1)]
  end

  defp print([]) do
  end

  defp print([head | tail]) do
    IO.puts head
    print(tail)
  end

  def fizzbuzz_count(total_count) when total_count >= 0 do
    total_count
    |> count()
    |> Enum.reverse()
    |> print()
  end
end