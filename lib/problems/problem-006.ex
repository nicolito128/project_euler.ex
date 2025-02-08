defmodule Problems.P6 do
  import Utils, only: [gauss_sum: 1, square_sum: 1]

  @moduledoc """
  Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

  Ref 1: https://en.m.wikipedia.org/wiki/Gauss_sum
  Ref 2: https://en.wikipedia.org/wiki/Sum_of_squares
  """

  def start(n \\ 100) do
    sum = gauss_sum(n)
    squares = square_sum(n)
    res = sum**2 - squares
    IO.puts("#{sum}^2 - #{squares} = #{res}")
  end
end
