#!/usr/bin/env elixir

# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

# What is the sum of the digits of the number 2^1000?

int_pow = fn(n, p) ->
  1..p
  |> Enum.map(fn(_) -> n end)
  |> Enum.reduce(&*/2)
end

char_to_integer = fn(c) -> c - hd('0') end

int_pow.(2, 1000)
|> Integer.to_char_list
|> Enum.map(char_to_integer)
|> Enum.sum
|> IO.inspect
