defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence) do
    sentence
    |> String.graphemes()
    |> Enum.filter(&String.match?(&1, ~r/[[:alnum:]]/))
    |> (&(&1 == Enum.uniq(&1))).()
  end
end
