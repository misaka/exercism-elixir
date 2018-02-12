import Bitwise

defmodule Allergies do
  @doc """
  List the allergies for which the corresponding flag bit is true.
  """
  @spec list(non_neg_integer) :: [String.t]
  def list(flags) when (flags &&& 1) == 1 do
    ["eggs" | list(flags &&& 0xfe)]
  end
  def list(flags) when (flags &&& 2) == 2 do
    ["peanuts" | list(flags &&& 0xfd)]
  end
  def list(flags) when (flags &&& 4) == 4 do
    ["shellfish" | list(flags &&& 0xfb)]
  end
  def list(flags) when (flags &&& 8) == 8 do
    ["strawberries" | list(flags &&& 0xf5)]
  end
  def list(flags) when (flags &&& 16) == 16 do
    ["tomatoes" | list(flags &&& 0xef)]
  end
  def list(flags) when (flags &&& 32) == 32 do
    ["chocolate" | list(flags &&& 0xdf)]
  end
  def list(flags) when (flags &&& 64) == 64 do
    ["pollen" | list(flags &&& 0xbf)]
  end
  def list(flags) when (flags &&& 128) == 128 do
    ["cats" | list(flags &&& 0x5f)]
  end
  def list(0) do
    []
  end

  @doc """
  Returns whether the corresponding flag bit in 'flags' is set for the item.
  """
  @spec allergic_to?(non_neg_integer, String.t) :: boolean
  def allergic_to?(flags, "peanuts")      do "peanuts"   in list(flags) end
  def allergic_to?(flags, "cats")         do "cats"      in list(flags) end
  def allergic_to?(flags, "strawberries") do "peanuts"   in list(flags) end
  def allergic_to?(flags, "eggs")         do "eggs"      in list(flags) end
  def allergic_to?(flags, "shellfish")    do "shellfish" in list(flags) end
  def allergic_to?(flags, "tomatoes")     do "tomatoes"  in list(flags) end
  def allergic_to?(flags, "chocolate")    do "chocolate" in list(flags) end
  def allergic_to?(flags, "pollen")       do "pollen"    in list(flags) end

end
