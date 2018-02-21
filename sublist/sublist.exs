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
  def compare(a, b) when length(a) == length(b) do
    cond do
      a === b -> :equal
      true   -> :unequal
    end
  end

  def compare(a, b) when length(a) < length(b) do
    cond do
      b |> Enum.take(length(a)) === a -> :sublist
      true ->
        case compare(a, tl(b)) do
          :equal -> :sublist
          result -> result
        end
    end
  end

  def compare(a, b) when length(a) > length(b) do
    cond do
      a |> Enum.take(length(b)) === b -> :superlist
      true ->
        case compare(tl(a), b) do
          :equal -> :superlist
          result -> result
        end
    end
  end

end
