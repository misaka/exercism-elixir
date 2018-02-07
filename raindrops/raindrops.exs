defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) when is_integer(number) do
    factors = factorise(number, 1, :math.sqrt(number)) |> Enum.sort |> Enum.uniq
    case convert(factors) do
      ""         -> number |> to_string
      plingplong -> plingplong
    end
  end

  def convert([3 | tail]) do "Pling" <> convert(tail) end
  def convert([5 | tail]) do "Plang" <> convert(tail) end
  def convert([7 | tail]) do "Plong" <> convert(tail) end
  def convert([factor | tail]) do
    "" <> convert(tail)
  end
  def convert([]) do
    ""
  end

  def factorise(_number, n, sqrt) when n > sqrt do
    []
  end

  def factorise(number, n, sqrt) when rem(number, n) == 0 do
    [n, trunc(number / n) | factorise(number, n+1, sqrt)]
  end

  def factorise(number, n, sqrt) do
    factorise(number, n+1, sqrt)
  end
end
