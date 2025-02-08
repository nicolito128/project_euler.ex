defmodule ProjectEuler.Problem9 do
  import Tuple, only: [sum: 1, product: 1]

  @moduledoc """
  A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
    a^2 + b^2 = c^2

  There exists exactly one Pythagorean triplet for which a + b + c = 1000.
  Find the product abc.

  Ref: https://en.wikipedia.org/wiki/Pythagorean_triple#Generating_a_triple
  """

  @spec euclid_formula(pos_integer(), pos_integer(), pos_integer()) :: {pos_integer(), pos_integer(), pos_integer()}
  def euclid_formula(m, n, k \\ 1) when m > n and n > 0, do: {k*(m*m - n*n), k*(2*m*n), k*(m*m + n*n)}

  def pythagorean_triplet(perim), do: pythagorean_triplet(perim, 2, 1, sum(euclid_formula(2, 1)))

  defp pythagorean_triplet(perim, _m, n, s) when s > perim, do: pythagorean_triplet(perim, n+2, n+1, sum(euclid_formula(n+2, n+1)))

  defp pythagorean_triplet(perim, m, n, perim), do: euclid_formula(m, n)

  defp pythagorean_triplet(perim, m, n, _s), do: pythagorean_triplet(perim, m+1, n, sum(euclid_formula(m+1, n)))

  def start(perim \\ 1000) do
    {a, b, c} = triplet = pythagorean_triplet(perim)
    IO.puts "sum({#{a}, #{b}, #{c}}) = #{sum(triplet)}"
    IO.puts "product({#{a}, #{b}, #{c}}) = #{product(triplet)}"
  end
end
