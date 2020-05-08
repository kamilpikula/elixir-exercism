defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(numbers, key) do
    list = Tuple.to_list(numbers)
    binary_search(list, key, 0, length(list) - 1)
  end

  defp binary_search(list, key, left, right) do
    if left <= right do
      middle = div(left + right, 2)
      item = Enum.at(list, middle)
      cond do
        key > item -> binary_search(list, key, middle + 1, right)
        key < item -> binary_search(list, key, left, middle - 1)
        true -> {:ok, middle}
      end
    else
      :not_found
    end
  end
end
