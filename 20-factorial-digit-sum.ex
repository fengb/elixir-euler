#!/usr/bin/env elixir

# n! means n × (n − 1) × ... × 3 × 2 × 1

# For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
# and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

# Find the sum of the digits in the number 100!

char_to_integer = fn(c) -> c - hd('0') end

1..100
|> Enum.reduce(&*/2)
|> Integer.to_char_list
|> Enum.map(char_to_integer)
|> Enum.sum
|> IO.inspect
