defmodule Problems.P5 do
  @moduledoc """
  2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

  What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
  """

  @doc """
  simplify evenly divide a number 'n' among all the values of 'list'.
  """
  def simplify(n, []), do: n

  def simplify(n, [head | tail]) when rem(n, head) == 0, do: simplify(div(n, head), tail)

  def simplify(n, [_head | tail]), do: simplify(n, tail)

  defp lcm(from, to, list) when from == (to + 1), do: list |> Enum.reduce(1, fn x, acc -> x * acc end)

  defp lcm(from, to, list) do
    f = simplify(from, list)
    lcm(from + 1, to, [f | list])
  end

  @doc """
  lcm stands for lowest common multiple.
  """
  def lcm(n) when n <= 0, do: nil

  def lcm(n), do: lcm(1, n, [])

  def start(n \\ 20) do
    res = lcm(n)
    IO.puts("The smallest positive number that is evenly divisible by all of the numbers from 1 to #{n} is: #{res}")
  end
end
