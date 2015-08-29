#!/usr/bin/env elixir

# The sum of the squares of the first ten natural numbers is,

# 1^2 + 2^2 + ... + 10^2 = 385

# The square of the sum of the first ten natural numbers is,

# (1 + 2 + ... + 10)^2 = 552 = 3025

# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

defmodule Euler6 do
  def sum_square_difference(nums) do
    square_sum(nums) - sum_square(nums)
  end

  def sum_square(nums) do
    nums
    |> Enum.map(&square/1)
    |> Enum.sum
  end

  def square_sum(nums) do
    nums
    |> Enum.sum
    |> square
  end

  defp square(num) do
    num*num
  end
end

1..100
|> Euler6.sum_square_difference
|> IO.puts
