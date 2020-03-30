defmodule CollatzConjecture do
  import Integer, only: [is_even: 1, is_odd: 1]

  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) when input >= 1 and is_integer(input), do: do_calc(input)
  def calc(_input), do: raise(FunctionClauseError, "Number must be a positive integer")

  # do_calc/1 takes an integer and initial state of steps. This function return the number of steps
  @spec do_calc(int :: pos_integer()) :: non_neg_integer()
  defp do_calc(1), do: 0
  defp do_calc(int) when is_even(int), do: 1 + do_calc(div(int, 2))
  defp do_calc(int) when is_odd(int), do: 1 + do_calc(int * 3 + 1)
end
