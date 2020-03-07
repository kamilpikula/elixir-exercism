defmodule Fizzbuzz do

  defp count(0, output) do
    output
  end

  defp count(number, output) when rem(number, 3) == 0 and rem(number, 5) == 0 do
    count(number - 1, ["fizzbuzz" | output])
  end

  defp count(number, output) when rem(number, 3) == 0 do
    count(number - 1, ["fizz" | output])
  end

  defp count(number, output) when rem(number, 5) == 0 do
    count(number - 1, ["buzz" | output])
  end

  defp count(number, output) do
    count(number - 1, [Integer.to_string(number) | output])
  end

  defp print([]) do
  end

  defp print([head | tail]) do
    IO.puts head
    print(tail)
  end

  def fizzbuzz_count(total_count) when total_count >= 0 do
    total_count
    |> count([])
    |> print()
  end
end