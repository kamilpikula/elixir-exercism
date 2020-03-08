defmodule Acronym do
  @regex ~r/([^A-Za-z']|([a-z](?=[A-Z])))/
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
        |> String.replace(@regex, " ")
        |> String.split
        |> Enum.map(&String.first/1)
        |> Enum.join
        |> String.upcase
  end
end
