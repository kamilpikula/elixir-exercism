defmodule CollatzConjecture do
  import Integer, only: [is_even: 1, is_odd: 1]

  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) when input >= 1 and is_integer(input) do
    do_calc(input, 0)
  end

  def calc(_input), do: raise(FunctionClauseError, "Number must be a positive integer")

  # do_calc/2 takes an integer and initial state of steps. This function return the number of steps
  @spec do_calc(int :: pos_integer(), steps :: non_neg_integer()) :: non_neg_integer()
  defp do_calc(1, steps), do: steps
  defp do_calc(int, steps) when is_even(int) do
    do_calc(div(int, 2), steps + 1)
  end
  defp do_calc(int, steps) when is_odd(int) do
    do_calc(int * 3 + 1, steps + 1)
  end
end
