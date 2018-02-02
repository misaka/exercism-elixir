defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(s, size) when size < 1 do
    []
  end
  def slices(s, size) do
    slices(s, size, s |> String.length)
  end
  def slices(s, size, l) when l >= size do
    [s |> String.slice(0, size)
     | slices(s |> String.slice(1, l-1), size, l-1)]
  end
  def slices(_s, size, l) when l < size do
    []
  end
end

