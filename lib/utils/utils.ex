defmodule Utils do
  @moduledoc """
  Some useful functions that can be used in the problems.
  """

  @spec prime?(number()) :: boolean()
  def prime?(0), do: false

  def prime?(1), do: false

  def prime?(n) when n < 0, do: prime?(abs(n))

  def prime?(n), do: prime?(n, 2)

  defp prime?(n, n), do: true

  defp prime?(n, p) when rem(n, p) == 0, do: false

  defp prime?(n, p), do: prime?(n, p+1)

  @spec composite?(number()) :: boolean()
  def composite?(0), do: false

  def composite?(1), do: false

  def composite?(n) when n < 0, do: composite?(abs(n))

  def composite?(n), do: not prime?(n)

  @spec gauss_sum(non_neg_integer()) :: non_neg_integer()
  def gauss_sum(n), do: (n * (n + 1)) / 2 |> ceil()

  @spec square_sum(non_neg_integer()) :: non_neg_integer()
  def square_sum(n), do: gauss_sum(n) * ((2*n + 1) / 3) |> ceil()
end
