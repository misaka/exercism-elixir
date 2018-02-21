defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t) :: non_neg_integer
  def score(<<letter>> <> word) do
    <<letter>> = <<letter>> |> String.downcase
    letter_score(letter) + score(word)
  end
  def score("") do 0 end


  def letter_score(letter) when letter in 'aeioulnrst' do 1 end
  def letter_score(letter) when letter in 'dg'         do 2 end
  def letter_score(letter) when letter in 'bcmp'       do 3 end
  def letter_score(letter) when letter in 'fhvwy'      do 4 end
  def letter_score(letter) when letter in 'k'          do 5 end
  def letter_score(letter) when letter in 'jx'         do 8 end
  def letter_score(letter) when letter in 'qz'         do 10 end
  def letter_score(_)                                  do 0 end

end
