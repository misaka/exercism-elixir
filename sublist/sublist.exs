defmodule Sublist do

  # a = [1, 2]
  # b = [1, 2]
  #
  # a = [3, 4]
  # b = [1, 2, 3, 4, 5]
  #
  # a = [1, 2, 3, 4, 5]
  # b = [3, 4]


  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    compare(a, b, :equal)
  end

  def compare(a, b, result) when length(a) == length(b) do
    if a === b do
      result
    else
      :unequal
    end
  end

  def compare(a, b, _result) when length(a) < length(b) do
    if b |> Enum.take(length(a)) === a do
      :sublist
    else
      compare(a, tl(b), :sublist)
    end
  end

  def compare(a, b, _result) when length(a) > length(b) do
    if a |> Enum.take(length(b)) === b do
      :superlist
    else
      compare(tl(a), b, :superlist)
    end
  end

end
