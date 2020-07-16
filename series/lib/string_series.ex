defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())

  import String, only: [slice: 2]
  def slices(s, size) do
    cond do
      size < 1                  -> []
      String.length(s) < size   -> []
      true                      -> slice_the_string(s, size, [])
    end
  end

  defp slice_the_string(s, size, array) do
      array = array ++ [slice(s, 0..size-1)]
      if String.length(s) > size do
        slice_the_string(slice(s, 1..String.length(s)), size, array)
      else
        array
      end
  end

  # Other solution
  #def slices(s, size) when size > 0 do
  #  s
  #  |> to_charlist()
  #  |> Enum.chunk_every(size, 1, :discard)
  #  |> Enum.map(&to_string/1)
  #end

  #def slices(_, _), do: []

end
