defmodule Scrabble do
  @letter_points %{
    1 => ~W[A E I O U L N R S T],
    2 => ~W[D G],
    3 => ~W[B C M P],
    4 => ~W[F H V W Y],
    5 => ~W[K],
    8 => ~W[J X],
    10 => ~W[Q Z]
  }
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer()
  def score(word) do
    letters = list_letters(word)
    |> Enum.map(&(letter_value/1))
    |> Enum.sum()
  end

  @spec list_letters(String.t()) :: list()
  defp list_letters(word) do
    word
    |> String.upcase()
    |> String.trim()
    |> String.graphemes()
  end

  @spec letter_value(String.t()) :: non_neg_integer()
  defp letter_value(letter) do
    @letter_points
    |> Enum.find(fn {_point, list} -> Enum.member?(list,  letter) end)
    |> elem(0)
  end
end
