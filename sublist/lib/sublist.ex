defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equallength(b) or unequal to the second list.
  """
  def compare(a, a), do: :equal
  def compare(a, b) do
    cond do
      sublist?(a, b) -> :sublist
      sublist?(b, a) -> :superlist
      true           -> :unequal
    end
  end

  def sublist?([], _), do: true
  def sublist?(a, b) do
    Enum.chunk_every(b, length(a), 1) |> Enum.member?(a)
  end
end
