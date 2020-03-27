defmodule ArmstrongNumber do
  @moduledoc """
  Provides a way to validate whether or not a number is an Armstrong number
  """

  @spec valid?(integer) :: boolean
  def valid?(number) do
    digits = Integer.digits(number)
    length = length(digits)
    Enum.reduce(digits, 0,  &(:math.pow(&1, length) + &2)) == number
  end
end
