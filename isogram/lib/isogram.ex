defmodule Isogram do
  @regex ~r/[[:punct:]|[:blank:]]/
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence) do
    sentence =
      sentence
      |> String.downcase()
      |> String.replace(@regex, "")

    uniq_sentence =
      sentence
      |> String.graphemes()
      |> Enum.uniq()
      |> List.to_string()

    sentence == uniq_sentence
  end
end
