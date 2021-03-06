defmodule PigLatin do
  defmacro vowels do
    ["a", "e", "i", "o", "u", "yt", "xr"]
  end

  defmacro vowel_doubles do
    ["yt", "xr"]
  end

  def starts_with_vowel(word) do
    vowels() |> Enum.any?(&(word |> String.starts_with?(&1)))
  end

  def starts_with_consonant(word) do
    !starts_with_vowel(word)
  end

  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) when is_bitstring(phrase) do
    phrase |> String.split |> translate() |> Enum.join(" ")
  end

  def translate([word | tail]) do
    [translate_word(word) | translate(tail)]
  end

  def translate([]) do
    []
  end

  def translate_word(word) do
    cond do
      starts_with_vowel(word) ->
        word <> "ay"
      true ->
        consonant = word |> collect_consonants

        (word |> String.trim_leading(consonant)) <> consonant <> "ay"
    end
  end

  def collect_consonants(<<letter>> <> _tail) when <<letter>> in vowels do
    ""
  end
  def collect_consonants(<<letter1, letter2>> <> _tail) when <<letter1, letter2>> in vowel_doubles do
    ""
  end
  def collect_consonants("qu" <> tail) do
    "qu" <> collect_consonants(tail)
  end
  def collect_consonants(<<letter>> <> tail) do
    <<letter>> <> collect_consonants(tail)
  end
  def collect_consonants("") do
    ""
  end
end

