#!/usr/bin/env elixir

# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

defmodule Euler5 do
  def lcm(m, n) when m > n,  do: lcm(m, n, n, [])
  def lcm(m, n) when m <= n, do: lcm(n, m, m, [])
  def lcm([m, n]), do: lcm(m, n)
  def lcm([head | tail]), do: lcm(tail) |> lcm(head)

  defp lcm(m, n, i, accu) do
    cond do
      i <= 1 ->
        [m, n] ++ accu
        |> Enum.reduce(&*/2)
      rem(m, i) == 0 and rem(n, i) == 0 ->
        new_m = div(m, i)
        new_n = div(n, i)
        lcm(new_m, new_n, new_n, [i] ++ accu)
      true ->
        lcm(m, n, i - 1, accu)
    end
  end
end

Euler5.lcm(1..20 |> Enum.to_list)
|> IO.puts
