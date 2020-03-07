defmodule Fizzbuzz do

  defp count(0) do
    []
  end
  
  defp count(number) do
    Enum.map(1..number, &number_to_fizzbuzz/1)
  end
  defp number_to_fizzbuzz(number) when rem(number, 3) == 0 and rem(number, 5) == 0 do
    "fizzbuzz"
  end

  defp number_to_fizzbuzz(number) when rem(number, 3) == 0 do
    "fizz"
  end

  defp number_to_fizzbuzz(number) when rem(number, 5) == 0 do
    "buzz"
  end

  defp number_to_fizzbuzz(number) do
    Integer.to_string(number)
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
    |> print()
  end
end