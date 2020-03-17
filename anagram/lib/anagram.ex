defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    candidates
    |> Enum.filter(&is_anagram?(base, &1))
  end

  @spec is_anagram?(String.t(), String.t()) :: boolean()
  defp is_anagram?(base, candidate) do
    sort_string(base) == sort_string(candidate)
    &&
    String.downcase(base) != String.downcase(candidate)
  end

  @spec sort_string(String.t()) :: [String.t()]
  defp sort_string(string) do
    string
    |> String.downcase()
    |> to_charlist()
    |> Enum.sort()
  end
end
