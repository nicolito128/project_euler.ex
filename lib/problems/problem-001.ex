defmodule Problems.P1 do
  @moduledoc """
  Ref: https://projecteuler.net/problem=1

  If we list all the natural numbers below 10 that are multiples of 3 or 5, we get and 3, 5, 6, 9. The sum of these multiples is 23.

  Find the sum of all the multiples of 3 or 5 below 1000.
  """

  def sum_of(n, _, _)
  when is_integer(n) and n <= 1, do: 0

  def sum_of(upper_bound, m1, m2)
  when rem(upper_bound - 1, m1) == 0 or rem(upper_bound - 1, m2) == 0 do
    (upper_bound - 1) + sum_of(upper_bound - 1, m1, m2)
  end

  def sum_of(upper_bound, m1, m2), do: sum_of(upper_bound - 1, m1, m2)

  def start() do
    IO.puts "Finding the sum of all the multiples of 3 or 5 below 1000..."
    result = sum_of(1000, 3, 5)

    IO.puts "sum_of_two(1000, 3, 5) = #{result}"
  end
end
