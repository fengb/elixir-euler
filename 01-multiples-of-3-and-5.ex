#!/usr/bin/env elixir

# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

# Find the sum of all the multiples of 3 or 5 below 1000.

1..999
|> Enum.filter(fn(n) -> rem(n, 3) == 0 or rem(n, 5) == 0 end)
|> Enum.reduce(&+/2)
|> IO.puts
