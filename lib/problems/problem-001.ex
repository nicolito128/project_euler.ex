defmodule Problems.P1 do
  @moduledoc """
  Ref: https://projecteuler.net/problem=1

  If we list all the natural numbers below 10 that are multiples of 3 or 5, we get and 3, 5, 6, 9. The sum of these multiples is 23.

  Find the sum of all the multiples of 3 or 5 below 1000.
  """

  def mult?(n, elem) when rem(n, elem) == 0, do: true
  def mult?(_n, _elem), do: false

  def any_mult?(_n, []), do: false
  def any_mult?(n, [h | rest]), do: mult?(n, h) or any_mult?(n, rest)

  def sum_of(n, mults), do: sum_of(n, mults, 0)

  def sum_of(0, _mults, acc), do: acc

  def sum_of(n, mults, acc) do
    if any_mult?(n - 1, mults) do
      sum_of(n - 1, mults, acc + (n - 1))
    else
      sum_of(n - 1, mults, acc)
    end
  end

  def start(upper \\ 1000, mults \\ [3, 5]) do
    IO.puts("Finding the sum of all the multiples of 3 or 5 below 1000...")
    result = sum_of(upper, mults)

    IO.puts("sum_of(upper = #{upper}, mults = [#{Enum.join(mults, ",")}]) = #{result}")
  end
end
