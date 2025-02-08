defmodule Problems.P8 do
  @moduledoc """
  The four adjacent digits in the 1000-digit number that have the greatest product are 9 x 9 x 8 x 9 = 5832.

  BIG NUMBER (see: problem8-number.txt)

  Find the thirteen adjacent digits in the 1000-digit number that have the greatest product. What is the value of this product?
  """

  defp product(_num, 0, acc), do: acc

  defp product(num, digits, acc) when num > 0, do: product(div(num, 10), digits - 1, acc * (rem(num, 10)))

  defp product(num, digits, acc), do: product(num, digits - 1, acc)

  def find_greatest_product(num, digits), do: find_greatest_product(num, digits, 1)

  defp find_greatest_product(0, _digits, greater), do: greater

  defp find_greatest_product(num, digits, greater) do
    newGreater = product(num, digits, 1)
    if newGreater > greater do
      find_greatest_product(div(num, 10), digits, newGreater)
    else
      find_greatest_product(div(num, 10), digits, greater)
    end
  end

  def start(adjacent_digits \\ 13) do
    case File.read("lib/problems/problem8-number.txt") do
      {:ok, str_number} ->
        bignum = String.to_integer(str_number)
        result = find_greatest_product(bignum, adjacent_digits)
        IO.puts "Result: #{result}"
      {:error, _ } ->
        IO.puts "File not found!"
    end

  end
end
