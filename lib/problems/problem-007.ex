defmodule Problems.P7 do
  @moduledoc """
  By listing the first six prime numbers: 2, 3, 5, 7, 11 and 13, we can see that the 6th prime is 13.

  What is the 10,001st prime number?
  """
  import Utils, only: [prime?: 1]

  def get_prime(n), do: gen_primes(n) |> hd

  def gen_primes(n) when n <= 0, do: []

  def gen_primes(n), do: gen_primes(n, 0, 2, [])

  defp gen_primes(n, n, _p, list), do: list

  defp gen_primes(n, c, p, list) do
    if prime?(p) do
      gen_primes(n, c + 1, p + 1, [p | list])
    else
      gen_primes(n, c, p + 1, list)
    end
  end

  def start(n \\ 10_001) do
    res = get_prime(n)
    IO.puts("Prime N°#{n} = #{res}")
  end
end
