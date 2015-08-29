#!/usr/bin/env elixir

# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

# Find the largest palindrome made from the product of two 3-digit numbers.

mult_zip = fn(l1, l2) ->
  Enum.flat_map(l1, fn(m) -> Enum.map(l2, fn(n) -> [m, n] end) end)
end

palindrome? = fn(n) ->
  chars = Integer.to_char_list(n)
  chars == Enum.reverse(chars)
end

mult_zip.(100..999, 100..999)
|> Enum.map(fn([m, n]) -> m * n end)
|> Enum.filter(palindrome?)
|> Enum.max
|> IO.puts
