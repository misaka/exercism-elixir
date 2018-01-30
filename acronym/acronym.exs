defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) when is_bitstring(string) do
    abbreviate(string |> String.split( ~r/\P{L}+|\p{Ll}(?=\p{Lu})/ )) |> List.to_string
  end
  def abbreviate([word | tail]) do
    [word |> String.at(0) |> String.upcase | abbreviate(tail)]
  end
  def abbreviate([]) do
    ""
  end
end
