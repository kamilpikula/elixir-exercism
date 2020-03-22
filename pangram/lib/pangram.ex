defmodule Pangram do
  @regex ~r/[[:punct:]|[:space:]|[:digit:]]/
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  @spec pangram?(String.t()) :: boolean
  def pangram?(sentence) do
    ascii_table = 97..122
    Enum.all?(ascii_table, fn
      x -> Enum.member?(string_conversion(sentence), x)
    end)
  end

  defp string_conversion(string) do
    string
    |> String.replace(@regex, "")
    |> String.downcase()
    |> String.to_charlist()
  end
end
