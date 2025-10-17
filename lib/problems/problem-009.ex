defmodule Problems.P9 do
  import Tuple, only: [sum: 1, product: 1]

  @moduledoc """
  A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
    a^2 + b^2 = c^2

  There exists exactly one Pythagorean triplet for which a + b + c = 1000.
  Find the product abc.

  -- Ref: https://en.wikipedia.org/wiki/Pythagorean_triple#Generating_a_triple

  --- m > n > 0
  --- a = k(m² - n²), b = k(2mn), c = k(m² + n²)
  --- k = 1, then
  --- perim = a + b + c
      perim = m² - n² + 2mn + m² + n²
      perim = 2m² + 2mn
      perim = 2m(m + n)
      perim / 2m = m + n
      (perim / 2m) - m = n = n(m) <- Formula to get n
  """

  @spec euclid_formula(pos_integer(), pos_integer(), pos_integer()) ::
          {pos_integer(), pos_integer(), pos_integer()}
  def euclid_formula(m, n, k \\ 1) when m > n and n > 0,
    do: {k * (m * m - n * n), k * (2 * m * n), k * (m * m + n * n)}

  @spec euclid_n_formula(pos_integer(), pos_integer()) :: pos_integer()
  def euclid_n_formula(perim, m) when m > 0, do: div(perim, 2 * m) - m

  def pythagorean_triplet(perim), do: pythagorean_triplet(perim, 2, euclid_formula(2, 1))

  defp pythagorean_triplet(perim, m, _) when m > div(perim, 2), do: nil

  defp pythagorean_triplet(perim, _m, {a, b, c} = triplet) when a + b + c == perim, do: triplet

  defp pythagorean_triplet(perim, m, {a, b, c} = triplet) when a + b + c < perim do
    n = euclid_n_formula(perim, m)

    if n >= m or n <= 0 do
      pythagorean_triplet(perim, m + 1, triplet)
    else
      pythagorean_triplet(perim, m + 1, euclid_formula(m, n))
    end
  end

  def start(perim \\ 1000) do
    {a, b, c} = triplet = pythagorean_triplet(perim)
    IO.puts("sum({#{a}, #{b}, #{c}}) = #{sum(triplet)}")
    IO.puts("product({#{a}, #{b}, #{c}}) = #{product(triplet)}")
  end
end
