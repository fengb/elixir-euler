#!/usr/bin/env elixir

# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

# a^2 + b^2 = c^2
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

defmodule Euler9 do
  def triplets(sum) do
    1..sum
    |> Enum.flat_map(fn(m) ->
         Enum.map(1..(sum - m), fn(n) -> [m, n, sum - m - n] end)
       end)
  end

  def mult_zip(l1, l2) do
    mult_zip(l1, l2, fn(m, n) -> [m, n] end)
  end

  def mult_zip(l1, l2, merge) do
    Enum.flat_map l1, fn(m) ->
      Enum.map l2, fn(n) ->
        merge.(m, n)
      end
    end
  end

  def pythagorean?(a, b, c) do
    square(a) + square(b) == square(c)
  end

  def square(num) do
    num*num
  end
end

Euler9.triplets(1000)
|> Enum.find(fn([a, b, c]) -> Euler9.pythagorean?(a, b, c) end)
|> Enum.reduce(&*/2)
|> IO.puts
