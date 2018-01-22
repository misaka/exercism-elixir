defmodule TwelveDays do
  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """
  @spec verse(number :: integer) :: String.t()
  def verse(number) do
    "On the #{verse_number(number)} day of Christmas my true love gave to me, " <> giveth(number) <>"."
  end

  def verse_number(number) when number == 1 do "first" end
  def verse_number(number) when number == 2 do "second" end
  def verse_number(number) when number == 3 do "third" end
  def verse_number(number) when number == 4 do "fourth" end
  def verse_number(number) when number == 5 do "fifth" end
  def verse_number(number) when number == 6 do "sixth" end
  def verse_number(number) when number == 7 do "seventh" end
  def verse_number(number) when number == 8 do "eighth" end
  def verse_number(number) when number == 9 do "ninth" end
  def verse_number(number) when number == 10 do "tenth" end
  def verse_number(number) when number == 11 do "eleventh" end
  def verse_number(number) when number == 12 do "twelfth" end

  def giveth(1) do
    "a Partridge in a Pear Tree"
  end
  def giveth(2) do
    "two Turtle Doves, and " <> giveth(1)
  end
  def giveth(3) do
    "three French Hens, " <> giveth(2)
  end
  def giveth(4) do
    "four Calling Birds, " <> giveth(3)
  end
  def giveth(5) do
    "five Gold Rings, " <> giveth(4)
  end
  def giveth(6) do
    "six Geese-a-Laying, " <> giveth(5)
  end
  def giveth(7) do
    "seven Swans-a-Swimming, " <> giveth(6)
  end
  def giveth(8) do
    "eight Maids-a-Milking, " <> giveth(7)
  end
  def giveth(9) do
    "nine Ladies Dancing, " <> giveth(8)
  end
  def giveth(10) do
    "ten Lords-a-Leaping, " <> giveth(9)
  end
  def giveth(11) do
    "eleven Pipers Piping, " <> giveth(10)
  end
  def giveth(12) do
    "twelve Drummers Drumming, " <> giveth(11)
  end

  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) when starting_verse == ending_verse do
    verse(starting_verse)
  end
  def verses(starting_verse, ending_verse) do
    verse(starting_verse) <> "\n" <> verses(starting_verse + 1, ending_verse)
  end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing():: String.t()
  def sing do
    verses(1, 12)
  end
end

