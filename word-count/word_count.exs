defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence |> String.split(~r{[^\pL\pN-]}u) |> count_words(%{})
  end

  def count_words(["" | tail], counts) do
    count_words(tail, counts)
  end

  def count_words([word | tail], counts) do
    word_lower = word |> String.downcase
    {_prev_count, new_counts} = get_and_update_in(counts, [word_lower], &{&1, (&1 || 0) + 1})
    count_words(tail, new_counts)
  end

  def count_words([], counts) do
    counts
  end
end
