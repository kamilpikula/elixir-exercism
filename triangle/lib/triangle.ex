defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) when a > 0 and b > 0 and c > 0 do
    if a + b > c and a + c > b and b + c > a do
      cond do
        a == b and b == c -> {:ok, :equilateral}
        a == b or a == c or b == c -> {:ok, :isosceles}
        a != b and a != c and b != c -> {:ok, :scalene}
      end
    else
      {:error, "side lengths violate triangle inequality"}
    end
  end

  def kind(_a, _b, _c) do
    {:error, "all side lengths must be positive"}
  end
end
