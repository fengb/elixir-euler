#!/usr/bin/env elixir

# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

# What is the 10 001st prime number?

defmodule Euler7 do
  def prime_stream do
    Stream.unfold {}, fn(accu) ->
      prime = next_prime(accu)
      { prime, :erlang.append_element(accu, prime) }
    end
  end

  defp next_prime({}), do: 2

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

Euler7.prime_stream
|> Enum.take(10_001)
|> List.last
|> IO.inspect
