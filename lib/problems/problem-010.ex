defmodule Problems.P10 do
  @moduledoc """
  The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

  Find the sum of all the primes below two million.
  """
  import Utils, only: [prime?: 1]

  def sum_primes(limit), do: sum_primes(limit, 2, 0)

  defp sum_primes(limit, n, acc) when n >= limit, do: acc

  defp sum_primes(limit, n, acc) do
    if prime?(n) do
      sum_primes(limit, n+1, acc+n)
    else
      sum_primes(limit, n+1, acc)
    end
  end

  def start(limit \\ 2_000_000) do
    result = sum_primes(limit)

    IO.puts "sum[2, #{limit}) = #{result}"
  end
end
