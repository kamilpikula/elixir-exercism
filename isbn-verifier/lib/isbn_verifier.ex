defmodule IsbnVerifier do
  # Find letter without "X"
  @regex ~r/[A-WY-Z]/

  @doc """
    Checks if a string is a valid ISBN-10 identifier

    ## Examples

      iex> ISBNVerifier.isbn?("3-598-21507-X")
      true

      iex> ISBNVerifier.isbn?("3-598-2K507-0")
      false

  """
  @spec isbn?(String.t()) :: boolean
  def isbn?(isbn) do
    isbn = String.replace(isbn, "-", "")
    cond do
      String.length(isbn) != 10   -> false
      String.match?(isbn, @regex) -> false
      true                        -> is_valid?(isbn)
    end
  end

  defp is_valid?(isbn) do
    isbn
    |> String.split("", trim: true)
    |> Enum.map(&String.replace(&1, "X", "10"))
    |> Enum.map(&String.to_integer(&1))
    |> Enum.reverse()
    |> Enum.with_index(1)
    |> Enum.reduce(0, fn {value, index}, acc ->
        acc + (index * value) end)
    |> rem(11) == 0
  end
end
