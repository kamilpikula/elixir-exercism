defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    Enum.frequencies(~w{#{string_processing(sentence)}})
  end

  defp string_processing(string) do
    string
    |> String.downcase()
    |> String.replace(~r/[:_,!&@$%^&]/, " ")
  end
end
