defmodule Day04 do

  def hash(suffix) do
    :crypto.hash(:md5, "ckczppom#{suffix}")
  end

  def valid_5_header?(<<0, 0, third, _rest::binary>>) when third < 0x10, do: true
  def valid_5_header?(_other), do: false

  def valid_6_header?(<<0, 0, 0, _rest::binary>>), do: true
  def valid_6_header?(_other), do: false

  def part1 do
    Stream.iterate(1, fn n -> n + 1 end)
    |> Enum.find(fn x -> x |> hash |> valid_5_header? end)
  end

  def part2 do
    Stream.iterate(1, fn n -> n + 1 end)
    |> Enum.find(fn x -> x |> hash |> valid_6_header? end)
  end
end

IO.puts "Found: #{Day04.part1()}"
IO.puts "Found: #{Day04.part2()}"
