defmodule PigLatin do
  defmacro vowels do
    'aeiou'
  end

  defmacro vowel_2 do
    ["yt", "xr"]
  end

  def starts_with_vowel(word) do
    vowels() |> Enum.any?(&(word |> String.starts_with?(&1)))
  end

  def starts_with_consonant(word) do
    (to_charlist(word) |> Enum.at(0)) not in vowels
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

  def translate_word(<<letter>> <> tail) when letter in vowels do
    <<letter>> <> tail <> "ay"
  end

  def translate_word(<<letter1, letter2>> <> tail) when <<letter1, letter2>> in vowel_2 do
    <<letter1, letter2>> <> tail <> "ay"
  end

  def translate_word(<<letter>> <> tail) when letter not in vowels do
    
    <<letter>> <> tail <> "ay"
  end
end

