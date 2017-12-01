defmodule Bob do
  def hey(input) do
    cond do
      String.match?(input, ~r/^\s*$/) -> "Fine. Be that way!"
      String.last(input) == "?" -> "Sure."
      String.replace(input, ~r/\P{L}/, "") |>
          String.match?(~r/^\p{Lu}+$/) ->
          "Whoa, chill out!"
      true -> "Whatever."
    end
  end
end
