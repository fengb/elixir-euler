#!/usr/bin/env elixir

# If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?

# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.

defmodule Euler17 do
  @words %{
     1 => "one",
     2 => "two",
     3 => "three",
     4 => "four",
     5 => "five",
     6 => "six",
     7 => "seven",
     8 => "eight",
     9 => "nine",
    10 => "ten",
    11 => "eleven",
    12 => "twelve",
    13 => "thirteen",
    14 => "fourteen",
    15 => "fifteen",
    16 => "sixteen",
    17 => "seventeen",
    18 => "eighteen",
    19 => "nineteen",
    20 => "twenty",
    30 => "thirty",
    40 => "forty",
    50 => "fifty",
    60 => "sixty",
    70 => "seventy",
    80 => "eighty",
    90 => "ninety",
  }

  def as_words(number), do: as_words_list(number) |> Enum.join(" ")

  def as_words_list(0), do: []
  def as_words_list(number) do
    cond do
      Map.has_key?(@words, number) ->
        [Map.get(@words, number)]
      number >= 1000 ->
        thousands = div(number, 1000) |> as_words_list
        rest = rem(number, 1000) |> as_words_list
        thousands ++ ["thousand"] ++ rest
      number >= 100 ->
        hundreds = div(number, 100) |> as_words_list
        rest = rem(number, 100) |> as_words_list
        if Enum.empty?(rest) do
          hundreds ++ ["hundred"]
        else
          hundreds ++ ["hundred", "and"] ++ rest
        end
      number >= 10 ->
        tens = (div(number, 10) * 10) |> as_words_list
        rest = rem(number, 10) |> as_words_list
        tens ++ rest
      true ->
        raise ArgumentError, message: "cannot convert #{number}"
    end
  end
end

1..1000
|> Enum.map(&Euler17.as_words_list/1)
|> List.flatten
|> Enum.join
|> String.length
|> IO.inspect
