defmodule Bob do
  @type input() :: String.t()

  @spec hey(input()) :: String.t()
  @doc """
  'hey' function returns a answer.
  """
  def hey(input) do
    input = String.trim(input)
    cond do
      scream?(input) and question?(input) ->  "Calm down, I know what I'm doing!"
      question?(input)                    ->  "Sure."
      input == ""                         ->  "Fine. Be that way!"
      scream?(input)                      ->  "Whoa, chill out!"
      true                                ->  "Whatever."
    end
  end

  defp scream?(input) do
    String.upcase(input) == input && String.downcase(input) != input
  end

  defp question?(input) do
    String.ends_with?(input, "?")
  end
end
