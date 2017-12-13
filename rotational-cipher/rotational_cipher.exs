defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) when not is_list(text) do
    to_string(rotate(to_charlist(text), shift))
  end

  def rotate([head | tail], shift) when 97 <= head and head <= 122 do
    [rotate_character(head, 97, shift) | rotate(tail, shift)]
  end

  def rotate([head | tail], shift) when 65 <= head and head <= 90 do
    [rotate_character(head, 65, shift) | rotate(tail, shift)]
  end

  def rotate([head | tail], shift) do
    [head | rotate(tail, shift)]
  end

  def rotate([], shift) do
    []
  end

  def rotate_character(character, offset, shift) do
    letter = character - offset
    offset + Integer.mod((letter + shift), 26)
  end
end

