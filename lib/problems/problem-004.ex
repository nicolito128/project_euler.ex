defmodule Problems.P4 do
  @moduledoc """
  A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is
  9009 = 99 * 91.

  Find the largest palindrome made from the product of two 3-digit numbers.

  - Ref: https://en.wikipedia.org/wiki/Palindromic_number
  """

  @spec palindrome?(integer()) :: boolean()
  def palindrome?(n) do
    str = Integer.to_string(n)
    rev = str |> String.reverse
    str == rev
  end

  def repeat(digit, n), do: repeat(digit, n, 0)

  defp repeat(_digit, 0, acc), do: acc

  defp repeat(digit, n, acc) do
    repeat(digit, n - 1, acc*10 + digit)
  end

  # Just use the brute force of computing power
  @spec largest_palindrome_with_digits(non_neg_integer()) :: integer()
  def largest_palindrome_with_digits(n) do
    max_n = repeat(9, n)
    min_n = repeat(9, n)
    max_rang = max_n..(10**(n-1))//-1
    min_rang = min_n..(10**(n-1))//-1

    Enum.reduce(max_rang, 0, fn maxelem, acc ->
      current = Enum.reduce(min_rang, 0, fn minelem, acc2 ->
        c = maxelem * minelem
        if palindrome?(c) and c > acc2, do: c, else: acc2
      end)
      if current > acc, do: current, else: acc
    end)
  end

  def start(digits \\ 3) do
    res = largest_palindrome_with_digits(digits)
    IO.puts("Largest palindrome made from the product of two #{digits}-digit numbers: #{res}")
  end
end
