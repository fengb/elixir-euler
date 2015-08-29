#!/usr/bin/env elixir

# Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.

# https://projecteuler.net/project/images/p015.gif

# How many such routes are there through a 20×20 grid?

defmodule Euler15 do
  def lattice(r, c) do
    { v, _cache } = lattice(r, c, %{})
    v
  end

  defp lattice(_r, 0, cache) do
    { 1, cache }
  end

  defp lattice(0, _c, cache) do
    { 1, cache }
  end

  defp lattice(r, c, cache) do
    key = { r, c }
    if Dict.has_key?(cache, key) do
      { Dict.get(cache, key), cache }
    else
      { v1, cache } = lattice(r - 1, c, cache)
      { v2, cache } = lattice(r, c - 1, cache)
      vt = v1 + v2
      { vt, Dict.put(cache, key, vt) }
    end
  end
end

Euler15.lattice(20, 20)
|> IO.puts
