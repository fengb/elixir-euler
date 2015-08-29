#!/usr/bin/env elixir

# The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number 600851475143 ?

defmodule Euler3 do
  def largest_factor(n), do: largest_factor(n, 2)

  defp largest_factor(n, i) do
    cond do
      i >= n         -> i
      rem(n, i) == 0 -> largest_factor(div(n, i), i)
      true           -> largest_factor(n, i + 1)
    end
  end
end

Euler3.largest_factor(600851475143)
|> IO.puts
