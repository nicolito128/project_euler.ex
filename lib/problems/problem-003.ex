defmodule Problems.P3 do
  import Utils, only: [prime?: 1]

  @moduledoc """
  The prime factors of 13195 are 5, 7, 13 and 29.

  What is the largest prime factor of the number 600851475143?

  - Ref 1: https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
  """

  def get_primes(n) do
    q = :math.sqrt(n) |> ceil
    primes = 2..q
    |> Stream.filter(&prime?/1)
    primes
  end

  def find_largest_factor(n) do
    get_primes(n)
    |> Enum.reduce(-1, fn x, acc ->
      if rem(n, x) == 0 and x > acc, do: x, else: acc
    end)
  end

  # change n with 600851475143
  def start(n \\ 13195) do
    res = find_largest_factor(n)
    IO.puts("The largest prime facot of #{n} is #{res}")
  end
end
