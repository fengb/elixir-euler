#!/usr/bin/env elixir

# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

# Find the sum of all the primes below two million.

defmodule Euler10 do
  def prime_stream do
    Stream.unfold {}, fn(accu) ->
      prime = next_prime(accu)
      { prime, accu |> :erlang.append_element(prime) }
    end
  end

  defp next_prime({}) do
    2
  end

  defp next_prime(prev_primes) do
    l = tuple_size(prev_primes) - 1
    prev = prev_primes |> elem(l)
    next_prime(prev + 1, prev_primes)
  end

  defp next_prime(num, prev_primes) do
    if prime?(num, prev_primes, 0) do
      num
    else
      next_prime(num + 1, prev_primes)
    end
  end

  defp prime?(num, prev_primes, i) do
    check = prev_primes |> elem(i)
    cond do
      num < check*check     -> true
      rem(num, check) == 0  -> false
      true                  -> prime?(num, prev_primes, i + 1)
    end
  end
end

Euler10.prime_stream
|> Enum.take_while(fn(n) -> n < 2_000_000 end)
|> Enum.sum
|> IO.inspect