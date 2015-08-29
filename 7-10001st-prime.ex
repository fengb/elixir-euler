#!/usr/bin/env elixir

# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

# What is the 10 001st prime number?

defmodule Euler7 do
  def prime_stream do
    Stream.unfold [], fn(accu) ->
      prime = next_prime(accu)
      { prime, [prime] ++ accu }
    end
  end

  defp next_prime([]) do
    2
  end

  defp next_prime(prev_primes) do
    [head | _tail ] = prev_primes
    next_prime(head + 1, prev_primes)
  end

  defp next_prime(i, prev_primes) do
    if prime?(i, prev_primes) do
      i
    else
      next_prime(i + 1, prev_primes)
    end
  end

  defp prime?(_num, []) do
    true
  end

  defp prime?(num, prev_primes) do
    [head | tail] = prev_primes
    if rem(num, head) == 0 do
      false
    else
      prime?(num, tail)
    end
  end
end

Euler7.prime_stream
|> Enum.take(10_001)
|> List.last
|> IO.inspect
