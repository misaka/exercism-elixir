defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    encode(string, '')
  end

  def encode("", '') do
    ""
  end

  def encode(<<char>> <> string, '') do
    encode(string, [char])
  end

  def encode(<<char>> <> string, [char | enc_tail]) do
    encode(string, [char | [char | enc_tail]])
  end

  def encode(string, enc_chars = [char | _]) when length(enc_chars) > 1 do
    (enc_chars |> length |> to_string) <> <<char>> <> encode(string, '')
  end

  def encode(string, enc_chars) do
    <<(enc_chars |> Enum.at(0))>> <> encode(string, '')
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    decode(string, "")
  end

  def decode(<<char>> <> string, count) when char in '0123456789' do
    decode(string, count <> <<char>>)
  end

  def decode(<<char>> <> string, "") do
    <<char>> <> decode(string, "")
  end

  def decode(<<char>> <> string, count) do
    repeat(char, count |> String.to_integer) <> decode(string, "")
  end

  def decode("", "") do
    ""
  end

  def repeat(_char, 0) do
    ""
  end
  def repeat(char, count) do
    <<char>> <> repeat(char, count-1)
  end
end
