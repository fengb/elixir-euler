#!/usr/bin/env elixir

# You are given the following information, but you may prefer to do some research for yourself.

# 1 Jan 1900 was a Monday.
# Thirty days has September,
# April, June and November.
# All the rest have thirty-one,
# Saving February alone,
# Which has twenty-eight, rain or shine.
# And on leap years, twenty-nine.
# A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.

# How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

defmodule Euler19 do
  def firsts(years) do
    Enum.flat_map years, fn(year) ->
      Enum.map(1..12, fn(month) -> {year, month, 1} end)
    end
  end
end

Euler19.firsts(1901..2000)
|> Enum.filter(fn(d) -> :calendar.day_of_the_week(d) == 7 end)
|> Enum.count
|> IO.inspect
