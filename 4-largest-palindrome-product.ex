#!/usr/bin/env elixir

# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

# Find the largest palindrome made from the product of two 3-digit numbers.

defmodule Euler4 do
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

  def palindrome?(n) do
    chars = Integer.to_char_list(n)
    chars == Enum.reverse(chars)
  end
end

100..999
|> Euler4.mult_zip(100..999, fn(m, n) -> m * n end)
|> Enum.filter(&Euler4.palindrome?/1)
|> Enum.max
|> IO.puts
